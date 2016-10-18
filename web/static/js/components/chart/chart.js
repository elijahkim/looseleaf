import { h, render, Component } from 'preact';
import buildChartForElement from "../../chart"

class Chart extends Component {
  componentDidMount() {
    let canvas = document.getElementById("js-chart");

    if (canvas) {
      let parent = document.getElementsByClassName("analysis__main-container")[0]
      buildChartForElement(canvas, parent)
    };
  }

  render() {
    return <canvas id="js-chart"></canvas>
  }
}

export default Chart
  // canvas.onclick = (event) => {
  //   let modalElem = document.getElementsByClassName("js-analysis-modal")[0];
  //   let entry = Math.floor(event.y / yIncrement);
  //   let data = {
  //     anger: Math.floor(entries["anger"][entry] * 100),
  //     joy: Math.floor(entries["joy"][entry] * 100),
  //     fear: Math.floor(entries["fear"][entry] * 100),
  //     sadness: Math.floor(entries["sadness"][entry] * 100),
  //     disgust: Math.floor(entries["disgust"][entry] * 100),
  //   }
  //
  //   modalElem.innerHTML = renderModal(data, () => {
  //     console.log("hello");
  //   });
  // }
