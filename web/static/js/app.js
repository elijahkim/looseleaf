// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"
import buildChartForElement from "./chart"
import Chart from "./components/chart/chart";
import Entry from "./components/entry";
import React from "react";
import ReactDOM from "react-dom";

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

let elem = document.getElementById("js-react-chart");

if (elem) {
  ReactDOM.render(<Chart />, elem)
}

let entryFormElem = document.getElementById("js-react-entry");

if (entryFormElem) {
  ReactDOM.render(<Entry />, entryFormElem)
}
