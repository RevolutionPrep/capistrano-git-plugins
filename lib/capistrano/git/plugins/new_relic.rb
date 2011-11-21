Capistrano::Configuration.instance(:must_exist).load do
  before 'deploy:restart', 'deploy:new_relic:enable'

  namespace :deploy do
    namespace :new_relic do
      desc 'Enable New Relic on :monitored servers'
      task :enable, :roles => :web do
        puts "\n\n### NEW RELIC: Enabling!\n\n"
        run "sudo cp #{deploy_to}/config/newrelic.enable.yml #{deploy_to}/config/newrelic.yml"
      end
    end
  end
end
