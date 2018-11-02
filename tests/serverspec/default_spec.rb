require "spec_helper"
require "serverspec"

package = "nodejs"
package_npm = nil
nodejs_command = "nodejs"
npm_command = "npm"

case os[:family]
when "redhat"
  nodejs_command = "node"
  package_npm = "npm"
when "ubuntu"
  package_npm = "nodejs"
when "freebsd"
  package = "www/node"
  package_npm = "www/npm"
  nodejs_command = "node"
when "openbsd"
  nodejs_command = "node"
  package = "node"
end

[
  package,
  package_npm
].each do |p|
  next if p.nil?
  describe package(p) do
    it { should be_installed }
  end
end

describe command "#{nodejs_command} --version" do
  its(:stderr) { should be_empty }
  case os[:family]
  when "ubuntu"
    its(:stdout) { should match(/^v8\.\d+\.\d+$/) }
  else
    its(:stdout) { should match(/^v\d+\.\d+\.\d+$/) }
  end
  its(:exit_status) { should eq 0 }
end

describe command "#{npm_command} --version" do
  its(:stderr) { should be_empty }
  its(:stdout) { should match(/^\d+\.\d+\.\d+$/) }
  its(:exit_status) { should eq 0 }
end
