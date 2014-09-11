# Rails blank app
An already working application with the latest libraries that we love already in place

## List of awesome things this App does:

* i18n and locale detection already in place
* javascript, css and assets in general are never managed by gems, they are instead stored in the `/vendor` folder
* it has `Bootstrap 3.2`
* it has `Backbone 1.1.2` with `hamlcoffe` as a templating solution
* it uses our own `Backbone way`
* it has support for `js i18n`
* it uses `font-awesome` and it is already properly configured to work in production
* it uses our own layout structure
* it already has our `bootstrapData` solution in place
* it has our `developer toolbar` that smoothes development :)
* it uses `rspec` for unit and controller testing
* it uses `cucumber` for integration and behaviour testing with support for poltergeist
* IE9 conditional stylesheet + css splitter to avoid the > 4096 selectors issue for that browser



## TODO

* document the application the awesome things this App does
* list the libraries supported
* open new branch for `devise`
* add default url config and email smtp settings
* document how to install poltergeist
* explain database, secrets examples
* add `mailcatcher` in development
* helper for flash messages
* helper to display an object errors
* basic cancacan config
* rescue CanCan::AccessDenied
* follow_return_to_or helper
* return_here_url helper
* seo_vars helper
* authenticate_user_and_return_to helper
* render_404 y ActiveRecord::RecordNotFound helper
* consider adding high_voltage for static pages management
