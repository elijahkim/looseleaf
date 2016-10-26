import { h, render, Component } from "preact";

class InfoModal extends Component {
  handleClick(e) {
    const { onClick } = this.props;
    e.preventDefault();

    onClick();
  }

  getClassName() {
    const { isActive } = this.props;
    let className = "analysis__info-modal-container";

    if (isActive) {
      className = "analysis__info-modal-container--active " + className ;
    }

    return className;
  }

  render() {
    const className = this.getClassName();

    return (
      <div className={className}>
        <h1 className="analysis__info-modal-header">Reading Your Mood Map</h1>
        <div className="analysis__info-modal-copy-container">
          <p>We used tone analysis to map text from your entries to the following moods</p>
        </div>
        <div className="analysis__info-modal-faces-container">
          <div className="analysis__info-modal-face-container">
            <img src={window.assets.joyFace} className="analysis__info-modal-face"/>
            <p>Joy</p>
          </div>
          <div className="analysis__info-modal-face-container">
            <img src={window.assets.angerFace} className="analysis__info-modal-face"/>
            <p>Anger</p>
          </div>
          <div className="analysis__info-modal-face-container">
            <img src={window.assets.fearFace} className="analysis__info-modal-face"/>
            <p>Fear</p>
          </div>
          <div className="analysis__info-modal-face-container">
            <img src={window.assets.sadFace} className="analysis__info-modal-face"/>
            <p>Sadness</p>
          </div>
          <div className="analysis__info-modal-face-container">
            <img src={window.assets.disgustFace} className="analysis__info-modal-face"/>
            <p>Disgust</p>
          </div>
        </div>
        <div className="analysis__info-modal-copy-container">
          <p>Moods closer to the top of the graph correspond to earlier entries</p>
        </div>
        <a onClick={(e) => this.handleClick(e)} className="analysis__info-modal-close-button">
          <img src={window.assets.xIcon} />
        </a>
      </div>
    )
  }
}

export default InfoModal;
