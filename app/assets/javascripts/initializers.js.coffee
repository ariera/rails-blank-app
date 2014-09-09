class App.Launcher extends Backbone.View
  initialize: ->
    @bootstraDataExample = new App.V.BoostrapDataExample(el: $("#x-bootstrap-example-from-backend-anchor"))
  _unload: ->
  load: ->
    @_unload()
    App.i18n.init()
    App.Triggers.init()
    @bootstraDataExample.load()
    this

$ ->
  App.launcher = new App.Launcher
  App.launcher.load()
