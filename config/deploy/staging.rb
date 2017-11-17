# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server "10.0.20.157", user: "dashle", roles: %w{app db web}
set :rails_env, 'development'
set :bundle_without, %w{test}.join(' ')

append :linked_files, "db/development.sqlite3"
