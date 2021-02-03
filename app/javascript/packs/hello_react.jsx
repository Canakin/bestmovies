// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, { Component} from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'


// sections on our html.erb file
const heading = document.getElementById('heading')
const information = document.getElementById('info')
const informationTwo = document.getElementById('infoTwo')
const lastMessage = document.getElementById('lastMessage')

// functions and classes used on our jsx file
const Hey = () => {
  return <strong><h1>Contact Info</h1></strong>
}

class Phone extends React.Component {
  state = {
    whatsapp: '90 536 268 95 21'
  };
  render() {
    return(
      <p><b>Phone Number: </b>{this.state.whatsapp}</p>
    )
  }
}

class Email extends React.Component {
  state = {
    email: 'scan.cimenser@gmail.com'
  };
  render() {
    return(
      <p><b>Email: </b><a href="mailto:scan.cimenser@gmail.com">{this.state.email}</a></p>
    )
  }
}

function Message() {
  return (
    <h5>We will be very thankful if you contact us about your ideas and reccommentdations to make our web app better.We deeply value your thoughts and ideas and looking forward to hear from you.</h5>
  );
};

// displaying our elements on our html.erb file
ReactDOM.render(
  <Hey />,
  heading,
);

const phone = <Phone />;
ReactDOM.render(
  phone,
  information,
);

const email = <Email />;
ReactDOM.render(
  email,
  informationTwo
);

const message = <Message />;
ReactDOM.render(
  message,
  lastMessage
)

// styling part
heading.style.textAlign = "center";
heading.style.fontFamily = 'Arial';
information.style.textAlign = "center";
informationTwo.style.textAlign = "center";
information.style.fontSize = "22px";
informationTwo.style.fontSize = "22px";
