/*    Gamma - Generic processing library
    See COPYRIGHT file for authors and license information
    Example:        Filter / Plucked String
    Description:    Simulation of a plucked string with noise and a feedback
                    delay-line.
*/

#include <cstdio>               // for printing to stdout
#define GAMMA_H_INC_ALL         // define this to include all header files
#define GAMMA_H_NO_IO           // define this to avoid bringing AudioIO from Gamma

#include "Gamma/Gamma.h"

#include "allocore/io/al_AudioIO.hpp"
#include "allocore/ui/al_SynthSequencer.hpp"

using namespace gam;
using namespace al;


class PluckedString : public SynthVoice {
public:

    PluckedString(double dt=0, float frq=440)
        : mAmp(1), mDur(2),
          env(0.1), fil(2), delay(1./27.5, 1./frq){
        decay(1.0);
        mAmpEnv.curve(4); // make segments lines
        mAmpEnv.levels(1,1,0);
        mPanEnv.curve(4);
    }
    PluckedString& Pan1(float v){ mPanEnv.levels(v,mPanEnv.levels()[1],v); return *this; }
    PluckedString& Pan2(float v){ mPanEnv.levels()[1]=v; return *this; }
    PluckedString& PanRise(float v){mPanRise=v; return *this; }
    PluckedString& freq(float v){delay.freq(v); return *this; }
    PluckedString& amp(float v){ mAmp=v; return *this; }
    PluckedString& dur(float v){
        mAmpEnv.lengths()[0] = v;
        return *this; }
    PluckedString& decay(float v){
        mAmpEnv.lengths()[1] = v;
        return *this;
    }

    //PluckedString& pan(float v){ mPan.pos(v); return *this; }
    void reset(){ env.reset(); }

    PluckedString& set(
        float a, float b, float c, float d, float e, float f, float g

    ){
        return dur(a).freq(b).amp(c).decay(d).Pan1(e).Pan2(f).PanRise(g);

    }

    float operator() (){
        return (*this)(noise()*env());
    }

    float operator() (float in){
        return delay(
                     fil( delay() + in )
                     );
    }

    virtual void onProcess(AudioIOData& io) override {
        while(io()){
            mPan.pos(mPanEnv());
            float s1 =  (*this)() * mAmpEnv() * mAmp;
            float s2;
            mEnvFollow(s1);
            mPan(s1, s1,s2);
            io.out(0) += s1;
            io.out(1) += s2;
        }
        if(mAmpEnv.done() && (mEnvFollow.value() < 0.001)) free();

    }

    virtual void onTriggerOn() override {
        mPanEnv.lengths()[0] = mDur * (1-mPanRise);
        mPanEnv.lengths()[1] = mDur * mPanRise;

        mAmpEnv.reset();
        mPanEnv.reset();
    }

protected:
    float mAmp;
    float mDur;
    float mPanRise;
    Pan<> mPan;
    NoiseWhite<> noise;
    Decay<> env;
    MovingAvg<> fil;
    Delay<float, ipl::Trunc> delay;
    Env<2> mAmpEnv;
    EnvFollow<> mEnvFollow;
    Env<2> mPanEnv;
};

int main(){

    SynthSequencer s;
    //s.add<PluckedString>( 0  ).set(6.5, 110,  0.3, .005, -1, 1, 0);
    s.add<PluckedString>( 0  ).set(6.5, 110,  0.3, 1.0, -1, 1, .5);
    s.add<PluckedString>( 3.5).set(6.5, 233,  0.3, .1, -1, 1, 1);
    PluckedString &thirdPluck = s.add<PluckedString>( 6.5).set(6.5, 329,  0.7, .0001, -1, 1, .5);
//    s.add(Func(thirdPluck, &PluckedString::freq, 440)).dt(8);

    AudioIO io(256, 44100., s.audioCB, &s);
    Domain::master().spu(io.framesPerSecond());
    io.start();
    printf("\nPress 'enter' to quit...\n"); getchar();
}