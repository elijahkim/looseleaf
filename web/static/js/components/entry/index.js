import React, { Component } from 'react';
import Carousel from "react-slick";
import map from "lodash/map";

let questions = [
  {
    question: "What's Up?",
    placeholder: "start typing your thoughts...",
  },
  {
    question: "What's on your mind?",
    placeholder: "start typing your thoughts...",
  },
  {
    question: "What's Up?",
    placeholder: "start typing your thoughts...",
  },
];

class Entry extends Component {
  constructor(props) {
    super(props)

    this.state = {
      questionIndex: 0,
    }
  }

  renderQuestions(questions) {
    let html = map(questions, (question, index) => {
      return (
        <div className="new-entry__question" key={index}>
          <div className="new-entry__label-container">
            <label className="new-entry__label">{ question.question }</label>
          </div>

          <div className="new-entry__textarea-container">
            <textarea
              className="new-entry__textarea"
              autoFocus={true}
              placeholder={question.placeholder}
            />
          </div>
        </div>
      );
    })

    return html;
  }

  handleNextClick(e) {
    e.preventDefault();
    let { questionIndex } = this.state;

    this.setState({ questionIndex: ((questionIndex + 1) % questions.length) });
  }

  handleBackClick(e) {
    e.preventDefault();
    let { questionIndex } = this.state;

    this.setState({ questionIndex: ((questionIndex - 1) % questions.length) });
  }

  render() {
    let settings = {
      infinite: false,
      speed: 500,
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
    };

    return (
      <Carousel className="new-entry__carousel">
        { this.renderQuestions(questions) }
      </Carousel>
    );
  }
}

export default Entry;
