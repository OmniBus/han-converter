$:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'active_support'
require 'converter_table'

module HanConverter
  include ConverterTable
  
  def to_simplified
    self.chars.map do |char|
      traditional_to_simplified[char] || char
    end.join('')
  end
  
  def to_traditional
    self.chars.map do |char|
      simplified_to_traditional[char] || char
    end.join('')
  end
  
end

class String
  include HanConverter
end