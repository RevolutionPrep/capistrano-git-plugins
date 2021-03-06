Capistrano::Configuration.instance(:must_exist).load do
  after 'deploy',            'deploy:notify_hoptoad'
  after 'deploy:migrations', 'deploy:notify_hoptoad'

  namespace :deploy do
    desc 'Notify Hoptoad of the deployment'
    task :notify_hoptoad, :only => {:primary => true}, :except => {:no_release => true} do
      rails_env = fetch(:hoptoad_env, fetch(:rails_env, 'production'))
      local_user = ENV['USER'] || ENV['USERNAME']
      executable = fetch(:rake, (RUBY_PLATFORM.downcase.include?('mswin') ? 'rake.bat' : 'rake'))
      executable = "cd #{deploy_to} && sudo #{executable}" if executable.include?('bundle exec')
      notify_command = "#{executable} hoptoad:deploy TO=#{rails_env} REPO=#{repository} USER=#{local_user} RAILS_ENV=#{rails_env}"
      notify_command << " API_KEY=#{ENV['API_KEY']}" if ENV['API_KEY']
      puts "\n\n### NOTIFY HOPTOAD: Notifying Hoptoad of Deploy (#{notify_command})\n\n"
      run "#{notify_command}"
      puts 'Hoptoad Notification Complete.'
    end
  end
end
