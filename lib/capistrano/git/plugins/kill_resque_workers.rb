Capistrano::Configuration.instance(:must_exist).load do
  after  'deploy:restart', 'resque_workers:restart'

  namespace :resque_workers do
    desc 'restart resque workers'
    task :restart, :roles=> :god do
      puts "\n\n### STOP RESQUE WORKERS!: Telling god to stop our resque workers.\n\n"
      run "sudo #{ruby_bin_dir}/ruby #{ruby_bin_dir}/god stop #{application}-resque; exit 0"
      puts "\n\n### START RESQUE WORKERS!: Telling god to start our resque workers.\n\n"
      run "sudo #{ruby_bin_dir}/ruby #{ruby_bin_dir}/god start #{application}-resque; exit 0"
    end
  end
end
