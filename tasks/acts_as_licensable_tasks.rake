namespace :acts_as_licensable do
  desc "Imports base licenses"
  task :setup => :environment do
    License.setup_licenses
  end
end