import Chart from "chart.js";
import map from "lodash/map";

let emotionColors = {
  "anger": "rgba(255, 9, 91, 0.3)", //red
  "fear": "rgba(187, 87, 185, 0.3)", // purple
  "disgust": "rgba(152, 215, 103, 0.3)", //green
  "sadness": "rgba(68, 150, 203, 0.3)", //blue
  "joy": "rgba(255, 209, 0, 0.3)", //yellow

}

function buildChartForElement(canvas, parent) {
  window.addEventListener('resize', resizeCanvas, false);
  let entriesElem = document.getElementsByClassName("js-entries")[0];
  let entries = JSON.parse(entriesElem.dataset.entries);
  console.log(entries)
  let datasets = map(entries, (entry, key) => {
    return {
      label: key,
      data: entry,
      radius: 0,
      backgroundColor: emotionColors[key],
    }
  })

  console.log(datasets);

  function resizeCanvas() {
    canvas.width = parent.offsetWidth;
    canvas.height = parent.offsetHeight * .9;
  }

  resizeCanvas();

  new Chart(canvas, {
    type: 'line',
    data: {
      labels: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      datasets: datasets
    },
    options: {
      legend: {
        display: false,
      },
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero:true,
            min: 0,
            max: 1,
          },
          display: false,
        }],
        xAxes: [{
          ticks: {
            beginAtZero:true
          },
          display: false,
        }]
      }
    }
  });
}

export default buildChartForElement;
