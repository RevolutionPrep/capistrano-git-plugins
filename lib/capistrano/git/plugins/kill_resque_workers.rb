Capistrano::Configuration.instance(:must_exist).load do
  after  'deploy:restart', 'resque_workers:restart'

  namespace :resque_workers do
    desc 'restart resque workers'
    task :restart, :roles=> :god do
      puts "\n\n### RESTART RESQUE WORKERS!: Telling god to restart our resque workers.\n\n"
      run "sudo #{configuration[:ruby_bin_dir]}/ruby #{configuration[:ruby_bin_dir]}god restart #{config[:application]-resque}; exit 0"
    end
  end
end
