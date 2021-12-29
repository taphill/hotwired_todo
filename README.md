# Hotwired Todo

A simple single page application to experiment with the Hotwire tech stack which is now included by default in Rails 7.

## Turbo-Frames

Turbo-frames are the main mechanism used to create this Rails SPA. You'll notice that the URL never changes even when navigating to new content, just like one would expect with a React SPA.

This is done by using a turbo-frame that I referenced by the ID of `main-content`. All views and partials within the main section of the HTML document are wrapped by this turbo-frame.

```html
<body>
  <header></header>
  <main>
    <turbo-frame id="main-content">
      <!-- Content goes here -->
    </turbo-frame>  
  </main>
  <footer></footer>
</body>
```

## Turbo-Streams

## Stimulus

I found Stimulus really simple and convenient to use for adding sprinkles of javascript where needed. The largest Stimulus controller for this application is the [password_controller](app/javascript/controllers/password_controller.js) which renders different images to provide the user feedback as to when their password meets the requirements being enforced by the [User](app/models/user.rb) model. 

![](https://s10.gifyu.com/images/password_validation.gif)
