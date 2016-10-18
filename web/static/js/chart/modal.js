function renderModal(data, onClick) {
  function handleClick() {
    onClick();
  };

  return (
    `
    <div class=analysis__modal-container>
      <h1 class=analysis__modal-header>Data Point</h1>
      <div class=analysis__modal-datapoints-container>
        <div class=analysis__modal-datapoint-container>
          <p>${data.joy}%</p>
          <p>Joy</p>
        </div>
        <div class=analysis__modal-datapoint-container>
          <p>${data.anger}%</p>
          <p>Anger</p>
        </div>
        <div class=analysis__modal-datapoint-container>
          <p>${data.fear}%</p>
          <p>Fear</p>
        </div>
        <div class=analysis__modal-datapoint-container>
          <p>${data.sadness}%</p>
          <p>Sadness</p>
        </div>
        <div class=analysis__modal-datapoint-container>
          <p>${data.disgust}%</p>
          <p>Disgust</p>
        </div>
      </div>
    <a href="" onclick=${handleClick()}>x</a>
    </div>
    `
  ).trim()
}

export default renderModal;
