# This variable may only be used in development or testing. Its purpose is to force any async task to be performed synchronously.
$async = true

Resque::Server.use(Rack::Auth::Basic) do |user, password|
  password == "mypassword"
end

# This made the web interface aware of the scheduled jobs
# https://github.com/bvandenbos/resque-scheduler/issues/118#issuecomment-3008832
# https://github.com/bvandenbos/resque-scheduler/issues/118#issuecomment-3039612

scheduled_tasks = YAML.load_file(Rails.root.join('lib','scheduled_tasks','schedule.yml'))
if scheduled_tasks.present?
  require 'resque/scheduler'
  Resque.schedule = scheduled_tasks
end
Dir[Rails.root.join("lib/scheduled_tasks/*.rb")].each{ |file| require file }
