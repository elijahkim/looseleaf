import Chart from "chart.js";
import StackBlur from "stackblur-canvas";
import each from "lodash/each"
import reverse from "lodash/reverse"
import renderModal from "./modal";

let emotionColors = {
  "anger": "rgba(255, 68, 90, 0.8)", //red
  "fear": "rgba(160, 127, 246, 0.9)", // purple
  "disgust": "rgba(152, 215, 103, 0.9)", //green
  "sadness": "rgba(68, 150, 203, 0.8)", //blue
  "joy": "rgba(255, 223, 43, 0.8)", //yellow
};

let emotionsWithOrder = [
  "joy",
  "anger",
  "fear",
  "sadness",
  "disgust"
];

var prevPoints = {};
var yIncrement;
var canvasWidth;
var canvasHeight;
var displayInfoModal = false;

function buildChartForElement(canvas, entries, parent) {
  let numPoints = entries["anger"].length

  //set default prevPoints to 0
  each([...Array(numPoints).keys()], (val) => {
    prevPoints[val] = 0
  })

  function resizeCanvas() {
    canvasWidth = canvas.width = parent.offsetWidth;
    canvasHeight = canvas.height = parent.offsetHeight;
    yIncrement = canvas.height / numPoints;
  }

  resizeCanvas();

  let context = canvas.getContext('2d')
  context.moveTo(0, 0);

  each(emotionsWithOrder, (emotion) => {
    createShape(context, {data: entries[emotion], color: emotionColors[emotion]});
  })

  StackBlur.canvasRGBA(canvas, 0, 0, canvasWidth, canvasHeight, 75)
}

function createShape(context, params) {
  let length = params.data.length
  context.beginPath();
  context.lineWidth = 0;
  context.fillStyle = params.color;
  context.strokeStyle = params.color;
  context.moveTo(prevPoints[0], yIncrement * 0);

  each([...Array(length).keys()], (val) => {
    context.rect(prevPoints[val], yIncrement * val, (canvasWidth * params.data[val]) + prevPoints[val], yIncrement)
    prevPoints[val] = prevPoints[val] + canvasWidth * params.data[val]
  })

  context.fill();
}

function drawBackPath(context, data, point) {
  context.lineTo(prevPoints[point], yIncrement * (point + 1));
  context.stroke();
  context.lineTo(prevPoints[point + 1], yIncrement * (point + 1));
  context.stroke();
}

function drawFrontPath(context, data, point) {
  let currentPathStart = canvasWidth * data[point] + prevPoints[point];
  context.lineTo(currentPathStart, yIncrement * point + 1);
  context.stroke();
  context.lineTo(currentPathStart, yIncrement * point);
  context.stroke();

  prevPoints[point] = currentPathStart;
}

export default buildChartForElement;
