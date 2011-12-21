Capistrano::Configuration.instance(:must_exist).load do
  after  'deploy:restart', 'resque_workers:restart'

  namespace :resque_workers do
    desc 'restart resque workers'
    task :restart, :roles=> :god do
      puts "\n\n### RESTART RESQUE WORKERS!: Killing the resque workers, God will resurrect them.\n\n"
      run "sudo #{deploy_to}/config/god/kill_resque_workers.sh; exit 0"
    end
  end
end
