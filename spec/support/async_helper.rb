RSpec.configure do |c|
  c.around(:each, async:false) do |example|
    $async = false
    example.call
    $async = true
  end
end
