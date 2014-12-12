set :source, 'app'

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'
set :data_dir, 'assets/data'

set :layouts_dir, 'views/layouts'
set :partials_dir, 'views/partials'

set :protect_from_csrf, true

activate :directory_indexes

###
# Compass
###

# Change Compass configuration
compass_config do |config|
  #config.output_style = :compact
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

require "better_errors"
configure :development do
  # Reload the browser automatically whenever files change
  activate :livereload

  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

helpers do
  def page_title
    title = data.page.heading ? "#{data.page.heading}" : "Just Another Site"
    strip_tags(title)
  end
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
