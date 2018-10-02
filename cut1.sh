echo "Shell script to install puma and run an ruby on rail apps"

echo "Run script? (y/n)"

read -e run
if [ "$run" == n ] ; then
  echo “chicken...”
  exit
else
  sudo apt-get update
  sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
  
 #the aboveInstall the rbenv and Ruby dependencies with apt-get:
        
  cd ~
  git clone git://github.com/sstephenson/rbenv.git .rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc
  #The above installs rbenv into your home directory, and sets the appropriate environment variables that will allow rbenv to the active version of Ruby.


  rbenv install -v 2.3.0    #install ruby
  rbenv global 2.3.0
  ruby -v
fi
