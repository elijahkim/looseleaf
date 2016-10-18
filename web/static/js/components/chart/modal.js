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
            <p>{entry.joy}%</p>
            <p>Joy</p>
          </div>
          <div className="analysis__modal-entrypoint-container">
            <p>{entry.anger}%</p>
            <p>Anger</p>
          </div>
          <div className="analysis__modal-entrypoint-container">
            <p>{entry.fear}%</p>
            <p>Fear</p>
          </div>
          <div className="analysis__modal-entrypoint-container">
            <p>{entry.sadness}%</p>
            <p>Sadness</p>
          </div>
          <div className="analysis__modal-entrypoint-container">
            <p>{entry.disgust}%</p>
            <p>Disgust</p>
          </div>
        </div>
        <a onClick={(e) => this.handleClick(e)}>x</a>
      </div>
    )
  }
}

export default Modal;
