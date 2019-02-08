# Api::Partials
Short description and motivation.

## Usage
How to use my plugin.

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
mount Api::Partials::Engine => "/anywhere"
```

In your application.js
```
//= require api_partials.js
```

In the head of your application.html.haml
```
<%= yield :api_partials %>
```

# Creating Partials
* in `app/views` create the folder `api_partials`
* inside `app/views/api_partials` create a folder with the name of the new partial, like `project_pie_chart`
* create a `_view.html.haml (or .html.erb)`, `_view.js`, and `_render.json.jbuilder` or `_render.html.haml (or .html.erb)`
* in  `_view.js` define a function that you want called to reload your partial. It MUST be named reload_COMPONENT_NAME, or in this case, `reload_project_pie_chart`

Let use it! (Using haml) `= api_partial(partial: "project_pie_chart", format: "json", locals: { project_id: 23 })`

#### Parameters
* `partial:` name of the partial
* `format:` either `json`, or `html`. This determines whether reload calls `_render.json.jbuilder` or `_render.html.haml (or .html.erb)`
* `locals:` hash of local variables that your view template will need
* optional `tags:` array of tags that is used to specify which partials should reload. If nothing is passed in, all partials will reload

#### Reload!
You probably want these partials to actually reload, right?
Call `reloadApiPartials()` from anywhere. This will reload all the partials on the page.

**Q: What if I want only a specific group of partials to reload?**
**A: That's what tags are for!**
`reloadApiPartials( [array, of, tags] )` Now only the api_partials that are **tagged** with at least 1 of the passed in tag, will reload!

#### Making this gem more useful
This gem can easily be utilized by something like [actioncable](https://guides.rubyonrails.org/action_cable_overview.html) (websockets) to live reload your views as things are changing in the background. All you need to do is call `reloadApiPartials`.


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
