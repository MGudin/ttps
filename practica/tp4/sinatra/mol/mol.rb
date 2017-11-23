
require 'bundler'

require_relative '../../mol/app'

Bundler.require

get '/' do
  Mol.run
  status Mol.statusCode
  "<div><p> Number:#{Mol.number}</p><p> Code: #{Mol.statusCode}</p></div>"
end
