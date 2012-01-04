require 'net/http'

Capistrano::Configuration.instance(:must_exist).load do
  after 'deploy',            'deploy:report'
  after 'deploy:migrations', 'deploy:report'

  namespace :deploy do
    desc "Report that the deployment was made"
    task :report, :except => { :no_release => true } do
      local_user = ENV['USER'] || ENV['USERNAME']
      puts "\n\n### REPORT DEPLOYMENT: Reporting deployment to deployment tracking system\n\n"
      url = URI.parse('http://rpdeploy.heroku.com/deployments')
      req = Net::HTTP::Post.new(url.path)
      req.set_form_data({ 'deployment[deployer]' => local_user, 'deployment[project_name]' => application }, ';')
      res = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
      case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        # OK
      else
        res.error!
      end
      # system 'open http://fierce-samurai-448.heroku.com/deployments'
      puts 'Deployment reported.'
    end
  end
end
