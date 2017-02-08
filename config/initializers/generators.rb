Rails.application.config.generators do |g|
  g.scaffold_stylesheet false
  g.test_framework :rspec,
    fixtures: true,
    view_specs: false,
    helper_specs: false,
    routing_specs: false,
    controller_specs: true,
    request_specs: false
  g.fixture_reqlacement :factory_girl, dir: "spec/factories"
end
