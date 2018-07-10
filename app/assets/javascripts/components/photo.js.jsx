var Photo = createReactClass({
  propTypes: {
    username: PropTypes.node,
    description: PropTypes.node
  },

  render: function() {
    return (
      <React.Fragment>
        Username: {this.props.username}
        Description: {this.props.description}
      </React.Fragment>
    );
  }
});

