# Hotwired Todo

A simple single-page application to experiment with the Hotwire tech stack which is now included by default in Rails 7.

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

Turbo-streams allow you to send fragments of a page change over WebSockets. You can see this in action when adding and deleting a todo item. Here's what the `users/todos_controller` looks like:

```ruby
module Users
  class TodosController < ApplicationController
    def create
      @todo = Todo.create(todo_params)
    end

    def destroy
      todo = Todo.find(params[:id])
      todo.destroy

      render turbo_stream: turbo_stream.remove(todo)
    end

    private

    def todo_params
      params.permit(:user_id, :description)
    end
  end
end
```

The create action uses some rails magic to render the ![users/todos/create.turbo_stream.erb](https://github.com/taphill/hotwired_todo/blob/main/app/views/users/todos/create.turbo_stream.erb) file.

For the destroy action we explicitly tell it to render a turbo stream. Without specifying a partial it will look for one based on the file structure. So in this case it looks for ![users/todos/_todo.html.erb](https://github.com/taphill/hotwired_todo/blob/main/app/views/users/todos/_todo.html.erb). We also pass it the object so it knows which one to remove from the page based on the `dom_id` method.

### Turbo Broadcasts

Turbo stream broadcasts should be used when you need to broadcast a page update to all users at the same time. This will allow every user to see the changes as they happen. More information can be found here: https://github.com/hotwired/turbo-rails/blob/main/app/models/concerns/turbo/broadcastable.rb

To get broadcasts working in production on Heroku you also need to enable the redis gem in your rails application and then add redis to Heroku. If you're running on a hobby dev you can easily do that from the command line like this:

```
$ heroku addons:create heroku-redis:hobby-dev
```

You can see an example of turbo-streams and turbo-broadcasts working in conjunction below:

![](https://s10.gifyu.com/images/turbo_broadcast.gif)

## Stimulus

I found Stimulus really simple and convenient to use for adding sprinkles of javascript where needed. The largest Stimulus controller for this application is the [password_controller](app/javascript/controllers/password_controller.js) which renders different images to provide the user feedback as to when their password meets the requirements being enforced by the [User](app/models/user.rb) model. 

![](https://s10.gifyu.com/images/password_validation.gif)