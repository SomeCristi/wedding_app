import React, { Component } from 'react'
import ReactDOM from 'react-dom'

class Weddings extends Component {

  constructor(props) {
    super(props);

    this.state = {
      term: '',
      autoCompleteResults: []
    };

    $('#selected_ids').attr('value', '')


    $.getJSON('/search_users?q=' + this.state.term)
      .then(response => this.setState({ autoCompleteResults: response }))
  }

  getAutoCompleteResults(e) {
    this.setState({
      term: e.target.value
    }, () => {
      $.getJSON('/search_users?q=' + this.state.term)
        .then(response => this.setState({ autoCompleteResults: response })).then(() =>  $('.user-item.selected').removeClass('selected')).then(() => $('#selected_ids').attr('value').split(',').map((id, index) => $('.user-item[data-id="' + id +'"]').addClass('selected')))
    });
  }

  toggleSelectedUser(e) {
    const elem = e.target;
    const userId = elem.getAttribute('data-id');

    $.ajax({
      url: `/weddings/toggle_user?user_id=${userId}`,
      dataType: 'json',
      method: 'PUT'
    }).done(function (data) {
      console.log(data)
      if (data.remaining_users >= 0 && data.toggled === true) {
        // $(elem).closest('.user-item').toggleClass('selected')
        $('#selected_ids').attr('value', data.ids)
        $('.user-item.selected').removeClass('selected')
        $('#selected_ids').attr('value').split(',').map((id, index) => $('.user-item[data-id="' + id +'"]').addClass('selected'))
      } else {
        alert("You've already selected the maximum number of people.")
      }
    });
  }

  render() {
    let autoCompleteList = this.state.autoCompleteResults.map((response, index) => {
      return (
        <div className="card user-item" style={{
          width: "10rem"
        }} data-id={response.id} key={index} onClick={this.toggleSelectedUser.bind(this)} >
          <img src={response.avatar} className="card-img-top" data-id={response.id} />
          <div className="card-body">
            <h5 className="user-name card-title" data-id={response.id}>{response.name}</h5>
          </div>
        </div>
      )
    });

    return (
      <div className="container">
        <div className="row my-4">
          <input ref={(input) => { this.searchBar = input }} className="form-control" value={this.state.term} onChange={this.getAutoCompleteResults.bind(this)} type='text' placeholder='Search people' />
        </div>
        <div className="row">
          <div className="user-item-wrapper card-deck">
            {autoCompleteList}
          </div>
        </div >
      </div>
    )
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Weddings />,
    document.getElementById("weddings-new-invitees-wrapper").appendChild(document.createElement('div')),
  )
});


// <img src="https://source.unsplash.com/random/200x300" className="user-picture" data-id={response.id} />
// <img src= {response.id}>{response.avatar.url} className="user-picture" data-id={response.id} />
