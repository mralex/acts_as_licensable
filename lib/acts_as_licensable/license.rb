class License < ActiveRecord::Base #:nodoc:
  
  validates_presence_of :name
  validates_presence_of :url
  validates_inclusion_of :kind, :in => [1, 2, 3]
  
  def self.setup_licenses
    license_yml = YAML.load(File.open(File.join(File.dirname(__FILE__), "../../fixtures/licenses.yml")))

    license_yml.each do |license|
      license = license.last
      
      if !License.find_by_url(license['url'])
        p "#{license['name']} #{license['version']}"
        License.create! license
        p " - Added"
      end
    end
  end
  
  def to_s
    "#{self.name} #{self.version}"
  end
end
