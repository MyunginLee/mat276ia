#include "al/util/scene/al_SequencerMIDI.hpp"




    SequencerMIDI sequencerMIDI;






        sequencerMIDI.init(1, mScene);


        sequencerMIDI.connectNoteOnToFunction([&](int note, int vel, int chan) {


            if (mKeyboardMode == 2.0) { // Event Sequencer


                //                int index = asciiToIndex(k.key());


                if (mTriggerSequence) {


                    std::cout << "___seq__ " << mAvailableSequences.getCurrent() << std::endl;


                    triggerNew(note, mAvailableSequences.getCurrent());


                } else {


                    mStaticAtom.presets.recallPreset(note);


                    mStaticAtom.presetToLoad.set(mStaticAtom.presets.getCurrentPresetName());


                    std::cout << "_____ " << mStaticAtom.presets.getCurrentPresetName() << std::endl;


                    triggerNew(note);


                }


            }


        });


        sequencerMIDI.connectNoteOffToFunction([&](int note, int vel, int chan) {


            if (mKeyboardMode == 2.0) {


                    std::cout << "trigger off " << note << std::endl;


                    mScene.triggerOff(note);


            }


        });

