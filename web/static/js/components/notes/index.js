import { h, render, Component } from 'preact';
import Tone from "tone";

class Notes extends Component {
  componentDidMount () {
    Tone.Transport.bpm.value = 180;

    var reverb = new Tone.JCReverb(0.4).connect(Tone.Master);
    var delay = new Tone.FeedbackDelay({ delayTime: '4t', feedback: 0.5, wet: 0.5 })
    this.synth1 = new Tone.DuoSynth().chain(delay, reverb);
    var synth2 = new Tone.DuoSynth().chain(delay, reverb);
    var synth3 = new Tone.DuoSynth().chain(delay, reverb);

    this.synth1.volume.value = -30;
    synth2.volume.value = -30;
    synth3.volume.value = -30;

    var loop = new Tone.Loop((time) => {
      this.synth1.triggerAttackRelease("A4","4n");
      synth2.triggerAttackRelease("C4","4n");
      synth3.triggerAttackRelease("E4","4n");
    }, "1n");

    loop.start("1m");
    Tone.Transport.start();
  }

  handleClick(e) {
    e.preventDefault
    this.synth1.triggerAttackRelease("A5", "8n");
  }

  render() {
    return (
      <div>
        <a onClick={(e) => this.handleClick(e)}>
          <h1>Click Me</h1>
        </a>
      </div>
    )
  }
}

export default Notes;
