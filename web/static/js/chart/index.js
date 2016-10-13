import Chart from "chart.js";

function buildChartForElement(canvas, parent) {
  window.addEventListener('resize', resizeCanvas, false);

  function resizeCanvas() {
    canvas.width = parent.offsetWidth;
    canvas.height = parent.offsetHeight * .9;
  }

  resizeCanvas();

  new Chart(canvas, {
    type: 'line',
    data: {
      labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
      datasets: [{
        label: 'apples',
        data: [12, 19, 3, 17, 6, 3, 7],
        backgroundColor: "rgba(54, 162, 235, 0.2)",
        radius: 0,
      }, {
        label: 'oranges',
        data: [2, 29, 5, 5, 2, 3, 10],
        backgroundColor: "rgba(255, 99, 132, 0.2)",
        radius: 0,
      }]
    },
    options: {
      legend: {
        display: false,
      },
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero:true
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
