CanCanCan.configure do |config|
    # Set the default ability class to `Ability`.
    config.default_ability_class = 'Ability'
  
    # Set the default authorizer class to `CanCan::Authorization::Handler`.
    config.default_authorizer = 'CanCan::Authorization::Handler'
  end