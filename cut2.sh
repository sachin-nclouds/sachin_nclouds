  echo "gem: --no-document" > ~/.gemrc
  gem install bundler     #install the bundler gem, to manage your application dependencies:
  gem install rails       #install rails
  rbenv rehash            #install shims for all Ruby executables
  rails -v                #show rails version

  #A few Rails features, such as the Asset Pipeline, depend on a Javascript runtime.
  sudo add-apt-repository ppa:chris-lea/node.js
  sudo apt-get install software-properties-common
  sudo apt-get update
  sudo apt-get install nodejs
  sudo apt-get update
  sudo apt-get install postgresql postgresql-contrib libpq-dev  # install PostgreSQL and its development libraries:

  rails new demoapp -d postgresql    #create a new Rails application, named "appname" that will use PostgreSQL as the database.
  cd ~/demoapp
  sudo -u postgres createuser -s demoapp   #create a PostgreSQL user
  sudo -u postgres psql                    #get into sql console
  cat /home/vagrant/databas > /home/vagrant/demoapp/config/database.yml   
  cd ~/.rbenv/plugins    #install the rbenv-vars plugin,
  git clone https://github.com/sstephenson/rbenv-vars.git
  cd ~/demoapp
  rake secret > key.txt   #generate the secret key, which will be used to verify the integrity of signed cookies
  cat /home/vagrant/env-var > /home/vagrant/demoapp/.rbenv-vars
  rbenv vars    #environment variables are set for your application with the rbenv-vars plugin
  RAILS_ENV=production rake db:create   #reate the production database:
  cd demoapp
  rails generate scaffold Task title:string note:text #generate a scaffold controller so our application will have something to look at: 
  RAILS_ENV=production rake db:migrate
  RAILS_ENV=production rake assets:precompile
  RAILS_ENV=production rails server --binding=192.168.33.3    #test out if your application work
  bundle    #outstanding dependencies, run Bundler:
  gem install puma -v 3.4.0
  cat /home/vagrant/puma1 >> /home/vagrant/demoapp/config/puma.rb
  mkdir -p shared/pids shared/sockets shared/log
  cd ~
  wget https://raw.githubusercontent.com/puma/puma/master/tools/jungle/upstart/puma-manager.conf
  wget https://raw.githubusercontent.com/puma/puma/master/tools/jungle/upstart/puma.conf
  sudo touch /etc/systemd/system/puma-manager.service                      
  sudo cp /home/vagrant/serv /etc/systemd/system/puma-manager.service
  sudo systemctl start puma-manager
  sudo apt-get install nginx
  sudo cp /home/vagrant/ngix /etc/nginx/sites-available/default
  sudo service nginx restart

