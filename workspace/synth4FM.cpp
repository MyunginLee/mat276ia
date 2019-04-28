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
using namespace std;


class FM : public SynthVoice {
public:
    // Unit generators
    gam::Pan<> mPan;
    gam::Osc<> mOsc;
    gam::Sine<> mVib;
    gam::ADSR<> mAmpEnv;
    gam::EnvFollow<> mEnvFollow;
    gam::Env<3> mModEnv;
    gam::Env<2> mVibEnv;

    // general synth parameters
    //float mPitch; // implicit
    float mAmp;
    float mDur;

    // specific parameters
    float mCarFrq;        // carrier frequency
    float mCarMul;        // carrier frequency multiplier
    float mModMul;        // modulator frequency multiplier
    float mModAmt;        // frequency modulation amount

    gam::Sine<> car, mod;    // carrier, modulator sine oscillators


    // Additional members
    Mesh mMesh;

     void init() override {
        mAmpEnv.curve(0); // linear segments
        mAmpEnv.levels(0,1,1,0);

        // We have the mesh be a sphere
        addDisc(mMesh, 1.0, 30);

        createInternalTriggerParameter("amplitude", 0.1, 0.0, 1.0);
        createInternalTriggerParameter("carrierFrequency", 60, 20, 5000);
        createInternalTriggerParameter("attackTime", 0.1, 0.01, 3.0);
        createInternalTriggerParameter("releaseTime", 3.0, 0.1, 10.0);
        createInternalTriggerParameter("curve", 4.0, -10.0, 10.0);
        createInternalTriggerParameter("pan", 0.0, -1.0, 1.0);
        createInternalTriggerParameter("table", 0, 0, 8);

        // FM
        createInternalTriggerParameter("dur", 2, 0.0, 10);
        createInternalTriggerParameter("carMul", 440, 20, 5000);
        createInternalTriggerParameter("modMul", 1, 0.0, 50);
        createInternalTriggerParameter("mModAmt", 50, 0.0, 100);


      }

    //
    virtual void onProcess(AudioIOData& io) override {
        float mCarFrq = getInternalParameterValue("carrierFrequency");
        float mCarMul = getInternalParameterValue("carMul");
        float mModMul = getInternalParameterValue("modMul");
        float mModAmt = getInternalParameterValue("mModAmt");
        float modFreq = mCarFrq * mModMul;
        while(io()){
            car.freq(mCarFrq*mCarMul + mod()*mModEnv()*modFreq);
            float s1 = car() * mAmpEnv() * mAmp;
            float s2;
            mEnvFollow(s1);
            mPan(s1, s1,s2);
            io.out(0) += s1;
            io.out(1) += s2;
            cout << mCarFrq << endl;
        }
        //if(mAmpEnv.done()) free();
        if(mAmpEnv.done() && (mEnvFollow.value() < 0.001)) free();
    }

    virtual void onProcess(Graphics &g) {
        float frequency = getInternalParameterValue("frequency");
        float amplitude = getInternalParameterValue("amplitude");
        g.pushMatrix();
        g.translate(amplitude,  amplitude, -4);
        float scaling = getInternalParameterValue("modMul")/100;
        g.scale(scaling * frequency/200, scaling * frequency/400, scaling* 1);
        g.color(mEnvFollow.value(), frequency/1000, mEnvFollow.value()* 10, 0.4);
        g.draw(mMesh);
        g.popMatrix();
    }
    
    virtual void onTriggerOn() override {

        float modFreq = mCarFrq * mModMul;
        mod.freq(modFreq);

        mAmpEnv.totalLength(mDur, 1);
        mModEnv.lengths()[1] = mAmpEnv.lengths()[1];

        mAmpEnv.reset();
        mModEnv.reset();
    }

    void updateFromParameters() {
        mOsc.freq(getInternalParameterValue("frequency"));
        mAmpEnv.attack(getInternalParameterValue("attackTime"));
        mAmpEnv.decay(getInternalParameterValue("attackTime"));
        mAmpEnv.release(getInternalParameterValue("releaseTime"));
        mAmpEnv.curve(getInternalParameterValue("curve"));
        mPan.pos(getInternalParameterValue("pan"));


// Something like this required        

        
    }

};


class MyApp : public App
{
    virtual void onCreate() override {
        ParameterGUI::initialize();

        // Play example sequence. Comment this line to start from scratch
    //    synthManager.synthSequencer().playSequence("synth2.synthSequence");
        synthManager.synthRecorder().verbose(true);
    }

    virtual void onSound(AudioIOData &io) override {
        synthManager.render(io); // Render audio
    }

    virtual void onDraw(Graphics &g) override {
        g.clear();
        synthManager.render(g);

        // Draw GUI
        ParameterGUI::beginDraw();
        ParameterGUI::beginPanel(synthManager.name());
        synthManager.drawSynthWidgets();
        ParameterGUI::endPanel();
        ParameterGUI::endDraw();
    }

    virtual void onKeyDown(Keyboard const& k) override {
      if (ParameterGUI::usingKeyboard()) { //Ignore keys if GUI is using them
        return;
      }
        if (k.shift()) {
            // If shift pressed then keyboard sets preset
            int presetNumber = asciiToIndex(k.key());
            synthManager.recallPreset(presetNumber);
        } else {
            // Otherwise trigger note for polyphonic synth
            int midiNote = asciiToMIDI(k.key());
            if (midiNote > 0) {
              synthManager.voice()->setInternalParameterValue("frequency", ::pow(2.f, (midiNote - 69.f)/12.f) * 432.f);
              synthManager.triggerOn(midiNote);
            }
        }
    }

    virtual void onKeyUp(Keyboard const& k) override {
        int midiNote = asciiToMIDI(k.key());
        if (midiNote > 0) {
            synthManager.triggerOff(midiNote);
        }
    }

    void onExit() override {
        ParameterGUI::cleanup();
    }

    SynthGUIManager<FM> synthManager {"synth3"};
};


int main(){
    MyApp app;

    app.navControl().active(false); // Disable navigation via keyboard, since we will be using keyboard for note triggering

    // Set up audio
    app.initAudio(48000., 256, 2, 0);
    // Set sampling rate for Gamma objects from app's audio
    gam::sampleRate(app.audioIO().framesPerSecond());
    app.audioIO().print();

    app.start();

}