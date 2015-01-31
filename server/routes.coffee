
Router.route '/rest', ->
  this.response.statusCode = 401
  this.response.end 'ERROR'
,
  where: 'server'

Router.route '/rest/:post', ->

  t = this.params.post
  q = this.params.query.token

  if q?
    if q isnt 'iamgood'
      this.response.statusCode = 401
      this.response.end 'ERROR'
      return

  this.response.statusCode = 200
  this.response.setHeader "Content-Type", "application/json"
  this.response.setHeader "Access-Control-Allow-Origin", "*"
  this.response.setHeader "Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"
  if t is 'design'
    this.response.end JSON.stringify
      text: DesignText
  else
    if t is 'dribble'
      this.response.end JSON.stringify
        text: DribbleText

    else
      this.response.statusCode = 401
      this.response.end 'ERROR'
,
  where: 'server'


DesignText = '<div class="container task">
    <h1>Design and Technology</h1>
    <p>
        Lorem ipsum ultricies risus sit tempor mattis turpis, scelerisque vitae aliquet egestas inceptos semper a, risus turpis molestie porta inceptos justo dictumst volutpat litora gravida eget sit diam morbi curabitur eleifend eget augue adipiscing a.
        <br><br>

        Sit fringilla facilisis himenaeos at vivamus gravida senectus fermentum ad pharetra, venenatis platea pharetra class nullam rutrum posuere egestas dapibus dui magna sapien duis nisi fames erat aenean nulla.

        Augue placerat fringilla sodales rutrum ultricies bibendum curae, hac tincidunt vehicula scelerisque laoreet curae, dictumst convallis phasellus integer nam facilisis augue etiam pretium aenean eros aliquet cras lobortis tortor aliquet.
        <br><br>

        Cubilia feugiat imperdiet scelerisque sed eleifend per eleifend, quisque elementum leo at donec phasellus, nullam non ullamcorper class tortor tempus.

        Tincidunt litora habitasse euismod iaculis sagittis rutrum nam est lacus, torquent pharetra mi sed et aliquam cras aenean, sed nec fringilla amet fermentum est mauris commodo.
    </p>
</div>'

DribbleText = '<div class="container">
    <h1>Dribble</h1>
    <p>
        Lorem ipsum ultricies risus sit tempor mattis turpis, scelerisque vitae aliquet egestas inceptos semper a, risus turpis molestie porta inceptos justo dictumst volutpat litora gravida eget sit diam morbi curabitur eleifend eget augue adipiscing a.
        <br><br>

        Sit fringilla facilisis himenaeos at vivamus gravida senectus fermentum ad pharetra, venenatis platea pharetra class nullam rutrum posuere egestas dapibus dui magna sapien duis nisi fames erat aenean nulla.

        Augue placerat fringilla sodales rutrum ultricies bibendum curae, hac tincidunt vehicula scelerisque laoreet curae, dictumst convallis phasellus integer nam facilisis augue etiam pretium aenean eros aliquet cras lobortis tortor aliquet.
        <br><br>

        Cubilia feugiat imperdiet scelerisque sed eleifend per eleifend, quisque elementum leo at donec phasellus, nullam non ullamcorper class tortor tempus.

        Tincidunt litora habitasse euismod iaculis sagittis rutrum nam est lacus, torquent pharetra mi sed et aliquam cras aenean, sed nec fringilla amet fermentum est mauris commodo.
    </p>


    <p>
        Lorem ipsum ultricies risus sit tempor mattis turpis, scelerisque vitae aliquet egestas inceptos semper a, risus turpis molestie porta inceptos justo dictumst volutpat litora gravida eget sit diam morbi curabitur eleifend eget augue adipiscing a.
        <br><br>

        Sit fringilla facilisis himenaeos at vivamus gravida senectus fermentum ad pharetra, venenatis platea pharetra class nullam rutrum posuere egestas dapibus dui magna sapien duis nisi fames erat aenean nulla.

        Augue placerat fringilla sodales rutrum ultricies bibendum curae, hac tincidunt vehicula scelerisque laoreet curae, dictumst convallis phasellus integer nam facilisis augue etiam pretium aenean eros aliquet cras lobortis tortor aliquet.
        <br><br>

        Cubilia feugiat imperdiet scelerisque sed eleifend per eleifend, quisque elementum leo at donec phasellus, nullam non ullamcorper class tortor tempus.

        Tincidunt litora habitasse euismod iaculis sagittis rutrum nam est lacus, torquent pharetra mi sed et aliquam cras aenean, sed nec fringilla amet fermentum est mauris commodo.
    </p>
</div>'