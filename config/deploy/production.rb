# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

set :dashle_server, ENV["DASHLE_SERVER"]
set :dashle_user,  ENV["DASHLE_USER"]
server fetch(:dashle_server, 'dashle'),
       user: fetch(:dashle_user, 'dashle'),
       roles: %w{app db web}

set :rails_env, 'development'
set :bundle_without, %w{test}.join(' ')
