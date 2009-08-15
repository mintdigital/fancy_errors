# This was pulled from a project and needs to be generalized to work
# stand-alone within this plugin

# require File.dirname(__FILE__) + '/../../test_helper'
# 
# class ErrorHelperTest < ActionView::TestCase
#   context "with valid shareable" do
#     setup do
#       @shareable = Factory(:shareable)
#     end
#     should "not output error messages" do
#       assert_equal "", error_messages_for(:shareable)
#     end
#   end
#   context "with invalid shareable" do
#     setup do
#       @shareable = Shareable.new
#       @shareable.valid?
#     end
#     should "output error message with default headings" do
#       assert_match "Uh oh!", error_messages_for(:shareable)
#     end
#     should "output error message with given heading" do
#       header = "New Header Message"
#       assert_match header, error_messages_for(:shareable, :header_message => header)
#     end
#     should "output error message in given order" do
#       errors = error_messages_for(:shareable, :order => { :shareable => [:user, :email] } )
#       errors = errors.match(%r{<li>(.*)</li>})[1].split('</li><li>')
#       assert errors[0].include?("User")
#       assert errors[1].include?("Email")
#     end
#     context "with object option" do
#       should "include correct error messages" do
#         errors = error_messages_for(:shareable, :object => @shareable)
#         @shareable.errors.full_messages.each do |e|
#           assert errors.include?('<li>'+e+'</li>') 
#         end
#       end
#     end
#     context "with another item" do
#       setup do
#         @item = ContentItem.new
#       end
#       should "output correct error messages for both items" do
#         errors = error_messages_for(:shareable, :item)
#         @shareable.errors.full_messages.each do |e|
#           assert errors.include?('<li>'+e+'</li>') 
#         end
#         @item.errors.full_messages.each do |e|
#           assert errors.include?('<li>'+e+'</li>') 
#         end
#       end
#     end
#   end
# end
