# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server fetch(:deploy_host), user: fetch(:deploy_user), roles: %w{app db web}

set :rails_env, 'production'
set :bundle_without, %w{test}.join(' ')

append :linked_files, "db/production.sqlite3"
