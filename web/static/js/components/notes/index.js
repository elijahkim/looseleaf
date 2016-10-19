import { h, render, Component } from 'preact';
import Tone from "tone";

class Notes extends Component {
  componentDidMount () {
    var synth = new Tone.Synth().toMaster();
    synth.triggerAttackRelease("C4", "8n");
  }

  render() {
    return <h1>Hello world</h1>
  }
}

export default Notes;
