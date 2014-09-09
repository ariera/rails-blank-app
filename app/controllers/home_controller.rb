class HomeController < ApplicationController
  layout "public"
  def index
    @bootstrap_example_from_backend = {
      title:   'BootstrapData is working! :D',
      content: "This text is generated from the backend, serialized into json in the render, and recovered and showed by javascript"
    }
  end
end
