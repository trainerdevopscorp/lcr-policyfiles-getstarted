if node['os'] == 'linux'
    file '/etc/motd' do
      content node['base']['message']
    end
  
  elsif node['os'] == 'windows'
    registry_key "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" do
      values [{:name => 'legalnoticetext', :data => 'node['base']['message']'}]
      action :create
      recursive true
    end
  end