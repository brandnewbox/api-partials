# Api::Partials
api-partials is a framework to allow your partials to reload whenever and however you would like them to

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'api-partials'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install api-partials
```

Mount to your application:
```
mount Api::Partials::Engine => "api_partials"
```

In your application.js
```
//= require api_partials.js
```

In controllers/application_controller.rb include the helper
```
helper Api::Partials::ApplicationHelper
```

In the head of your application.html.haml
```
<%= yield :api_partials %>
```

Create a folder for your partials at
```
app/views/api_partials
```

# Creating Partials
* inside `app/views/api_partials` create a folder with the name of the new partial, like `your_new_component`
* inside `app/views/api_partials/your_new_component` you need:
  * `_view.html.haml (or .html.erb)`
  * `_script.js`
  * `_response.json.jbuilder` OR `_response.html.haml (or .html.erb)` depending on what `format` you pass in

* in  `_script.js` define a function that you want called to reload your partial. This function will be passed 2 params,v the DOM element and the resposne like: (api_partial, response). **It MUST be named reload_your_new_component**, or in this case, `reload_your_new_component(api_partial, response)`. If you're partial is nested like `views/api_partials/users/your_new_component`, your method would be called `reload_users_your_new_component(api_partial, response)`

### Use it!
Put this is your view, and you're good to go!
```
= api_partial(partial: "your_new_component", format: "json", locals: { project_id: 23 })
```

### Parameters
* `partial:` name of the partial
* `format:` either `json`, or `html`. This determines whether reload calls `_response.json.jbuilder` or `_response.html.haml (or .html.erb)`
* `locals:` hash of local variables that your view template will need
* `tags:` optional. Array that specificies when this partial should reload. If nothing is passed in, the partial will reload always.

### Reload!
You probably want these partials to actually reload, right?
Call `reloadApiPartials()` from anywhere. This will reload all the partials on the page.

* **Q: What if I want only a specific group of partials to reload?**
* **A: That's what tags are for!**
`reloadApiPartials( [array, of, tags] )` Now only the api_partials that are **tagged** with at least 1 of the passed in tag, will reload!

* **Q: Can I just replace the html with the same view.html template on reload? I don't want render.html to be a copy of view.html**
* **A: Of course. In render.html, render the view partial like so :`= render partial: "/api_partials/your_new_component/view"`**

### Making this gem more useful
This gem can easily be utilized by something like [actioncable](https://guides.rubyonrails.org/action_cable_overview.html) (websockets) to live reload your views as things are changing in the background. All you need to do is call `reloadApiPartials`.


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
