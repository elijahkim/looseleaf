import { h, render, Component } from 'preact';

class Modal extends Component {
  handleClick(e) {
    e.preventDefault()
    let { onClick } = this.props;
    onClick();
  }

  render() {
    let { entry } = this.props;

    return (
      <div className="analysis__modal-container">
        <h1 className="analysis__modal-header">Data Point</h1>
        <div className="analysis__modal-datapoints-container">
          <div className="analysis__modal-datapoint-container">
            <p className="analysis__modal-percents">{entry.joy}%</p>
            <p>Joy</p>
          </div>
          <div className="analysis__modal-entrypoint-container">
            <p className="analysis__modal-percents">{entry.anger}%</p>
            <p>Anger</p>
          </div>
          <div className="analysis__modal-entrypoint-container">
            <p className="analysis__modal-percents">{entry.fear}%</p>
            <p>Fear</p>
          </div>
          <div className="analysis__modal-entrypoint-container">
            <p className="analysis__modal-percents">{entry.sadness}%</p>
            <p>Sadness</p>
          </div>
          <div className="analysis__modal-entrypoint-container">
            <p className="analysis__modal-percents">{entry.disgust}%</p>
            <p>Disgust</p>
          </div>
        </div>
        <a
          onClick={(e) => this.handleClick(e)}
          className="analysis__modal-close-button"
        >
          x
        </a>
      </div>
    )
  }
}

export default Modal;
