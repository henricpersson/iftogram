# This file is used by Rack-based servers to start the application.

# REM auth token instagram: 32437409.5941c46.f099d110aa5c4971a4b9d81e7c52a39f


require ::File.expand_path('../config/environment',  __FILE__)
run Iftogram::Application
