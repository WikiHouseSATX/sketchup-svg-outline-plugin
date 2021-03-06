require 'sketchup.rb'
require 'extensions.rb'
require 'LangHandler.rb'

###########################################################
#
#    Scalable Vector Graphics (SVG) from Google Sketchup Faces
#    Copyright (C) 2009 Simon Beard
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
###########################################################
FLIGHTS_OF_IDEAS_DEV = true #Set to false if you aren't doing development
if FLIGHTS_OF_IDEAS_DEV
  $:.unshift "#{File.expand_path(File.dirname(__FILE__))}/sketchup-svg-outline-plugin"
  base_dir = "sketchup-svg-outline-plugin/FlightsOfIdeas"
else
  base_dir = "FlightsOfIdeas"
end
FLIGHTS_OF_IDEAS_DIR = "plugins/#{base_dir}"

$uStrings = LanguageHandler.new("FlightsOfIdeasSVG")
flightsOfIdeasExtensionSVG = SketchupExtension.new $uStrings.GetString("FlightsOfIdeasSVG"), "#{base_dir}/svgExportTools.rb"
flightsOfIdeasExtensionSVG.description=$uStrings.GetString("These tools allow the creation of SVG files using object faces.")
flightsOfIdeasExtensionSVG.version = "0.99999.b1"
Sketchup.register_extension flightsOfIdeasExtensionSVG, true
#$uStrings = LanguageHandler.new("FlightsOfIdeasSTL") #STL coming soon...
#flightsOfIdeasExtensionSTL = SketchupExtension.new $uStrings.GetString("FlightsOfIdeasSTL"), "#{base_dir}/stlExportTools.rb"
#flightsOfIdeasExtensionSTL.description=$uStrings.GetString("These tools allow the creation of STL files using object faces.")
#Sketchup.register_extension flightsOfIdeasExtensionSTL, true
$uStrings = LanguageHandler.new("FlightsOfIdeasTools")
flightsOfIdeasExtensionTools = SketchupExtension.new $uStrings.GetString("FlightsOfIdeasTools"), "#{base_dir}/flightsOfIdeasTools.rb"
flightsOfIdeasExtensionTools.description=$uStrings.GetString("Go straight to the Flights Of Ideas website.")
flightsOfIdeasExtensionTools.version = "0.99999.b1"
Sketchup.register_extension flightsOfIdeasExtensionTools, true
if FLIGHTS_OF_IDEAS_DEV
  $uStrings = LanguageHandler.new("FlightsOfIdeasReloadTool")
  flightsOfIdeasReloadTools = SketchupExtension.new $uStrings.GetString("FlightsOfIdeasReloadTool"), "#{base_dir}/reload_tool.rb"
  flightsOfIdeasReloadTools.description=$uStrings.GetString("Reload the code without restarting Sketchup")
  flightsOfIdeasReloadTools.version = "0.99999.b1"
  Sketchup.register_extension flightsOfIdeasReloadTools, true
end
###########################################################
