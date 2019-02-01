#
# Cookbook:: hardening
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


if node['os'] == 'linux'
  file '/tmp/foobar' do
    content node['configure-node']['greeting']
  end

  include_recipe 'os-hardening::default'
  include_recipe 'hardening::remediation'

elsif node['os'] == 'windows'
  file 'C:\\Users\\Administrator\\foobar.txt' do
    content node['hardening']['greeting']
  end

  include_recipe 'windows-hardening'
end
