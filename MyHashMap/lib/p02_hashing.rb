# require 'byebug'
# class Fixnum
#   # Fixnum#hash already implemented for you
# end
#
# class Array
#   def hash
#     debugger
#     if self == []
#       return 1179642477448084948
#     else
#       index_sum = 0
#       key = 541
#       self.each_with_index do |el, idx|
#         el_k = el * key
#         el_k = el_k ^(el_k >> 3)
#         el_k *= key * (idx + key)
#         index_sum += el_k
#       end
#       index_sum.hash
#     end
#   end
# end
#
# class String
#   def hash
#     index_sum = 0
#     key = 1193
#     self.each_byte.with_index do |byte, idx|
#       byte_k = byte * key
#       byte_k = byte_k ^byte_k >> 4
#       byte_k *= key * (idx + key)
#       index_sum += byte_k
#     end
#     index_sum.hash
#   end
# end
#
# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     arr_hash = self.to_a.sort
#     total_hash = 0
#     arr_hash.each do |sub_arr|
#       sub_arr.each do |el|
#         total_hash += el.hash
#       end
#     end
#     total_hash
#   end
# end
