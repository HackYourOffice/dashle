# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
#
# WARNING: When adding Rails components (views, cables, …) with custom CSS/JS requirements,
#          don't add them to the top-level `application.*` files, but list them here explicitly.
Rails.application.config.assets.precompile += %w( dashboards.js dashboards.css )
