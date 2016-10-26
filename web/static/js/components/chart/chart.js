import { h, render, Component } from "preact";
import buildChartForElement from "../../chart"
import Modal from "./modal";
import InfoModal from "./infoModal";

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

    this.setState({ currentEntry: entry, renderModal: true });
  }

  handleModalClose() {
    this.setState({ renderModal: false });
  }

  renderModal() {
    // OLD MODAL
    // let { entries, currentEntry } = this.state;
    // let entry = {
    //   anger: Math.floor(entries["anger"][currentEntry] * 100),
    //   joy: Math.floor(entries["joy"][currentEntry] * 100),
    //   fear: Math.floor(entries["fear"][currentEntry] * 100),
    //   sadness: Math.floor(entries["sadness"][currentEntry] * 100),
    //   disgust: Math.floor(entries["disgust"][currentEntry] * 100),
    // }
    //
    // return <Modal entry={entry} onClick={() => this.handleModalClose()} />

    return <InfoModal />
  }

  render() {
    return (
      <div>
        <canvas id="js-chart" />
        <a onClick={(e) => this.handleClick(e)}>
          <img src={window.assets.questionIcon} className="analysis__question-mark"/>
        </a>
        <InfoModal
          isActive={this.state.renderModal}
          onClick={() => this.handleModalClose()}
        />
      </div>
    )
  }
}

export default Chart
