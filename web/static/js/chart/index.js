import Chart from "chart.js";
import map from "lodash/map";
import StackBlur from "stackblur-canvas";

let emotionColors = {
  "anger": "rgba(255, 68, 90, 0.8)", //red
  "fear": "rgba(160, 127, 246, 0.9)", // purple
  "disgust": "rgba(152, 215, 103, 0.9)", //green
  "sadness": "rgba(68, 150, 203, 0.8)", //blue
  "joy": "rgba(255, 223, 43, 0.8)", //yellow
}

var prevPoints = { 0: 0, 1: 0, 2: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0 }
var yIncrement;
var canvasWidth;
var canvasHeight;

function buildChartForElement(canvas, parent) {
  let entriesElem = document.getElementsByClassName("js-entries")[0];
  let entries = JSON.parse(entriesElem.dataset.entries);

  function resizeCanvas() {
    canvasWidth = canvas.width = parent.offsetWidth;
    canvasHeight = canvas.height = parent.offsetHeight;
    yIncrement = canvas.height / 9;
  }

  resizeCanvas();

  let context = canvas.getContext('2d')
  context.moveTo(0, 0);
  createShape(context, {data: entries["joy"], color: emotionColors["joy"]});
  createShape(context, {data: entries["anger"], color: emotionColors["anger"]});
  createShape(context, {data: entries["fear"], color: emotionColors["fear"]});
  createShape(context, {data: entries["sadness"], color: emotionColors["sadness"]});
  createShape(context, {data: entries["disgust"], color: emotionColors["disgust"]});

  StackBlur.canvasRGBA(canvas, 0, 0, canvasWidth, canvasHeight, 100)
}

function createShape(context, params) {
  context.lineWidth = 0;
  context.fillStyle = params.color;
  context.strokeStyle = params.color;
  context.beginPath();
  context.moveTo(prevPoints[0], yIncrement * 0);

  drawBackPath(context, params.data, 0);
  drawBackPath(context, params.data, 1);
  drawBackPath(context, params.data, 2);
  drawBackPath(context, params.data, 3);
  drawBackPath(context, params.data, 4);
  drawBackPath(context, params.data, 5);
  drawBackPath(context, params.data, 6);
  drawBackPath(context, params.data, 7);
  drawBackPath(context, params.data, 8);
  drawBackPath(context, params.data, 9);

  // context.lineTo(canvasWidth * params.data[9], yIncrement * 9);
  // context.stroke();

  drawFrontPath(context, params.data, 9);
  drawFrontPath(context, params.data, 8);
  drawFrontPath(context, params.data, 7);
  drawFrontPath(context, params.data, 6);
  drawFrontPath(context, params.data, 5);
  drawFrontPath(context, params.data, 4);
  drawFrontPath(context, params.data, 3);
  drawFrontPath(context, params.data, 2);
  drawFrontPath(context, params.data, 1);
  drawFrontPath(context, params.data, 0);

  context.fill();
}

function drawBackPath(context, data, point) {
  context.lineTo(prevPoints[point], yIncrement * point);
  context.stroke();
}

function drawFrontPath(context, data, point) {
  context.lineTo(canvasWidth * data[point] + prevPoints[point], yIncrement * point);
  context.stroke();

  prevPoints[point] = (canvasWidth * data[point]) + prevPoints[point];
}

export default buildChartForElement;
