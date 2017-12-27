# Copyright:: 2011, Mathieu Sauve-Frankel <msf@kisoku.net>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'rubygems'
require 'chef'
require 'chef/handler'
require 'victor_ops/client'

# Main class for victorops handler
class VictoropsHandler < Chef::Handler
  attr_reader :options
  def initialize(opts = {})
    @options = opts
  end

  def report
    if options[:api_url].nil?
      Chef::Log.error('Victorops API URL not provided')
      raise Errno::ENOENT
    end
    if options[:routing_key].nil?
      Chef::Log.error('Victorops routing key not provided')
      raise Errno::ENOENT
    end
    victorops_client = VictorOps::Client.new api_url: options[:api_url], routing_key: options[:routing_key]
    victorops_client.critical desc: "Chef run failed on node #{options[:fqdn]}" unless success?
  rescue => error
    Chef::Log.error('Could not raise victorops alert! Error - %s' - error.response.body)
  end
end
