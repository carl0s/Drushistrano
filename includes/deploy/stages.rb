desc "deploy to production environment"
task :development do
  set :stage_name, "development"
  set :application, "#APPLICATION_NAME#"
  set :deploy_to,  "/var/apps/#APPLICATION_NAME#"

  # Remote GIT repository (ex: git://github.com/drupal/drupal.git)
  set :repository,  "#REMOTE_GIT_PATH#"
  set :branch, "#BRANCH#"

  # Remote WEB [IP|HOST][:PORT] (ex: 127.0.0.1:8888 or twinbitlabs.com:8888)
  role :web, "#REMOTE_SERVER_IP#", :primary => true
  # Remote DBMS SERVER [IP|HOST][:PORT] (ex: 127.0.0.1:8888 or twinbitlabs.com:8888)
  role :db, "#REMOTE_SERVER_IP#", :primary => true, :no_release => true

  # Remote Drush override
  #set :remote_drush, "cd #{current_path}; sudo /home/deploy/bin/drush"

  # SSH Configurations (user, pass) (is highly suggested to use ssh key authentication)
  set :user, "#USER#"
#  set :pass, 'deploy'
  set :use_sudo, false

  # Drupal domains to deploy (keep "default" domain or at least one domain to use)
  # Ex: "sites/all/app1 sites/all/app2" --> set :domains, ["app1", "app2"]
  set :domains, ["#DOMAIN#"]

  # Specify which domain needs to be used as default (optional)
  # This is useful for single site environment to have a different default dir rather than standard "default" dir
  # Ex: set :default_domain, "app1"
  #set :default_domain, ""

  # create virtual host symlinks
  #set :virtual_host, ["app1.test.com"]
end
