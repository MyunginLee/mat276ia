/*    Gamma - Generic processing library
    See COPYRIGHT file for authors and license information
    Example:
    Description:
*/


#include <cstdio>               // for printing to stdout
#define GAMMA_H_INC_ALL         // define this to include all header files
#define GAMMA_H_NO_IO           // define this to avoid bringing AudioIO from Gamma

#include "Gamma/Gamma.h"
#include "Gamma/Types.h"

#include "al/core/app/al_App.hpp"
#include "al/core/graphics/al_Shapes.hpp"
#include "al/util/ui/al_Parameter.hpp"
#include "al/util/scene/al_PolySynth.hpp"
#include "al/util/scene/al_SynthSequencer.hpp"
#include "al/util/ui/al_ControlGUI.hpp"

//using namespace gam;
using namespace al;

// tables for oscillator
gam::ArrayPow2<float>
    tbSaw(2048), tbSqr(2048), tbImp(2048), tbSin(2048), tbPls(2048),
    tb__1(2048), tb__2(2048), tb__3(2048), tb__4(2048);

class FM : public SynthVoice {
public:
    // Unit generators
    gam::Pan<> mPan;
    gam::Osc<> mOsc;
    gam::Sine<> mVib;
    gam::ADSR<> mAmpEnv;
    gam::ADSR<> mVibEnv;
    gam::EnvFollow<> mEnvFollow;

    // general synth parameters
    //float mPitch; // implicit
    float mAmp;
    float mDur;
    Pan<> mPan;

    // specific parameters
    float mCarFrq;        // carrier frequency
    float mCarMul;        // carrier frequency multiplier
    float mModMul;        // modulator frequency multiplier
    float mModAmt;        // frequency modulation amount

    gam::Sine<> car, mod;    // carrier, modulator sine oscillators
    gam::Env<3> mAmpEnv;
    gam::Env<3> mModEnv;
    gam::EnvFollow<> mEnvFollow;


    float vibValue;

    // Additional members
    Mesh mMesh;

     void init() override {
        mAmpEnv.curve(0); // linear segments
        mAmpEnv.levels(0,1,1,0);
        mVibEnv.curve(0);

        // We have the mesh be a sphere
        addDisc(mMesh, 1.0, 30);

        createInternalTriggerParameter("amplitude", 0.1, 0.0, 1.0);
        createInternalTriggerParameter("frequency", 60, 20, 5000);
        createInternalTriggerParameter("attackTime", 0.1, 0.01, 3.0);
        createInternalTriggerParameter("releaseTime", 3.0, 0.1, 10.0);
        createInternalTriggerParameter("curve", 4.0, -10.0, 10.0);
        createInternalTriggerParameter("pan", 0.0, -1.0, 1.0);
        createInternalTriggerParameter("table", 0, 0, 8);
        createInternalTriggerParameter("vibRate1", 3.5, 0.2, 20);
        createInternalTriggerParameter("vibRate2", 5.8, 0.2, 20);
        createInternalTriggerParameter("vibRise", 0.5, 0.1, 2);
        createInternalTriggerParameter("vibDepth", 0.005, 0.0, 0.3);
        // FM
        createInternalTriggerParameter("dur", 0.005, 0.0, 0.3);
        createInternalTriggerParameter("carMul", 0.005, 0.0, 0.3);
        createInternalTriggerParameter("modMul", 0.005, 0.0, 0.3);
        createInternalTriggerParameter("idx1", 0.005, 0.0, 0.3);
        createInternalTriggerParameter("idx2", 0.005, 0.0, 0.3);
        createInternalTriggerParameter("idx3", 0.005, 0.0, 0.3);


      }

    //
    virtual void onProcess(AudioIOData& io) override {

        float modFreq = mCarFrq * mModMul;
        while(io()){
            car.freq(mCarFrq*mCarMul + mod()*mModEnv()*modFreq);
            float s1 = car() * mAmpEnv() * mAmp;
            float s2;
            mEnvFollow(s1);
            mPan(s1, s1,s2);
            io.out(0) += s1;
            io.out(1) += s2;
        }
        //if(mAmpEnv.done()) free();
        if(mAmpEnv.done() && (mEnvFollow.value() < 0.001)) free();
    }

    virtual void onTriggerOn() override {

        float modFreq = mCarFrq * mModMul;
        mod.freq(modFreq);

        mAmpEnv.totalLength(mDur, 1);
        mModEnv.lengths()[1] = mAmpEnv.lengths()[1];

        mAmpEnv.reset();
        mModEnv.reset();
    }

protected:

};


int main(){

    SynthSequencer s;
    s.add<FM>( 0).set( 5, 262, 0.5, 0.1,0.1, 0.75, 0.01,7,5, 1,1.0007, 1);//brass
    s.add<FM>( 5).freq(220);//brass
    s.add<FM>(10).set( 5, 262, 0.5, 0.1,0.1, 0.75, 0.01,4,4, 3,2.0007,-1);//clarinet
    s.add<FM>(15).set( 5, 262, 0.5, 0.2,0.1, 0.75, 2.00,2,2, 3,1.0007, 0);//oboe
    s.add<FM>(20).set( 5, 139, 0.5, 0.2,0.1, 0.75, 0.01,1.5,1.5, 5,1.0007, 0);//bassoon
    s.add<FM>(25).set(10, 100, 0.5, 0.001,9.90, 0.8, 7.0, 7.0, 7.0, 1, 1.4, 0);//gong
    s.add<FM>(30).set(0.3,100, 0.5, 0.001,0.25, 0.8, 5,5,5, 1, 1.48, 0);//drum

    AudioIO io(256, 44100., s.audioCB, &s);
    Domain::master().spu(io.framesPerSecond());
    io.start();
    printf("\nPress 'enter' to quit...\n"); getchar();
}