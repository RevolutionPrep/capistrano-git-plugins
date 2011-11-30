Capistrano::Configuration.instance(:must_exist).load do
  after 'deploy:update_code', 'deploy:bundle:build'

  namespace :deploy do
    namespace :bundle do
      desc 'Bundles the gems into the repo'
      task :build, :except => { :no_release => true } do
        puts "\n\n### BUNDLE GEMS: Bundling up gems into vendor/bundle\n\n"
        args = ["--deployment"]
        args << "--without #{bundle_without.join(" ")}" unless bundle_without.empty?
        run "cd #{deploy_to} && sudo -u #{sudo_user} #{ruby_bin_dir}/bundle install #{args.join(' ')}"
      end

      desc 'Wipes out and rebundles the gems into the repo'
      task :rebuild, :except => { :no_release => true } do
        puts "\n\n### REBUILDING BUNDLE!: Wiping the existing bundle and rebuilding from scratch...\n\n"
        run "sudo rm -rf #{deploy_to}/vendor/bundle"
        args = ["--deployment"]
        args << "--without #{bundle_without.join(" ")}" unless bundle_without.empty?
        run "cd #{deploy_to} && sudo -u #{sudo_user} #{ruby_bin_dir}/bundle install #{args.join(' ')}"
      end
    end
  end
end
