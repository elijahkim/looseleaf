import { h, render, Component } from 'preact';
import buildChartForElement from "../../chart"
import Modal from "./modal";

class Chart extends Component {
  constructor() {
    super();

    this.state = {
      entries: JSON.parse(document.getElementsByClassName("js-entries")[0].dataset.entries),
      renderModal: false,
      currentEntry: null,
    };
  }

  componentDidMount() {
    let { entries } = this.state;
    let canvas = document.getElementById("js-chart");
    let parent = document.getElementsByClassName("analysis__main-container")[0];
    buildChartForElement(canvas, entries, parent);
  }

  handleClick(e) {
    let canvas = document.getElementById("js-chart");
    let { entries } = this.state;
    let entry = Math.floor(event.y / (canvas.height / (entries["anger"].length - 1)));
    console.log(entry);
    console.log(entries["joy"]);

    this.setState({ currentEntry: entry, renderModal: true });
  }

  handleModalClose() {
    this.setState({ renderModal: false });
  }

  renderModal() {
    let { entries, currentEntry } = this.state;
    let entry = {
      anger: Math.floor(entries["anger"][currentEntry] * 100),
      joy: Math.floor(entries["joy"][currentEntry] * 100),
      fear: Math.floor(entries["fear"][currentEntry] * 100),
      sadness: Math.floor(entries["sadness"][currentEntry] * 100),
      disgust: Math.floor(entries["disgust"][currentEntry] * 100),
    }

    return <Modal entry={entry} onClick={() => this.handleModalClose()} />
  }

  render() {
    return (
      <div>
        <canvas id="js-chart" onClick={(e) => this.handleClick(e)} />
        { this.state.renderModal && this.renderModal() }
      </div>
    )
  }
}

export default Chart
