class Node
  attr_reader :value
  attr_accessor :left,:right
  def initialize(value=nil)
    @value=value
    @left=nil
    @right=nil
  end
end

class BST
  attr_accessor :root_node
  def initialize(root_value=nil)
     @root_node=Node.new(root_value)
  end

  def insert(node,value)

    if node.value==value
      return value
    elsif value< node.value
      if node.left.nil?
        node.left=Node.new(value)
      else
        insert(node.left,value)
      end

    elsif value>node.value
      if node.right.nil?
        node.right=Node.new(value)
      else
        insert(node.right,value)
      end
    else
      return node=Node.new(value)
    end
  end


  def search(node,key)

     if node.value==key
         return node
     end

    if key<node.value
     return search(node.left,key )
    end
      search(node.right,key)
  rescue StandardError=>e
    return nil
  end


  def sort_asc(tree)
    if !tree.left.nil?
      sort_asc(tree.left)
    end
    puts tree.value
      if !tree.right.nil?
        sort_asc(tree.right)
      end
  end

  def sort_desc(tree)
    if !tree.right.nil?
      sort_desc(tree.right)
    end
    puts tree.value
    if !tree.left.nil?
      sort_desc(tree.left)
    end
  end


end
lock=0
input=nil
while true do
  puts "Please Enter Your Count Number:"
  input=gets.chomp
  break if input=="end"
  next if input.to_i==0
  counter=1

  while counter<=input.to_i  do
    puts "Please Enter Your Number #{counter}/#{input.to_i}:"
    values=gets.chomp.to_i
    if lock==0
      bst_object= BST.new(values)
      lock=1
    else
      bst_object.insert(bst_object.root_node,values)
    end
    counter+=1
  end

  puts "Please Enter Your Number for Search:"
  var_search=gets.chomp.to_i
      proc_search= bst_object.search(bst_object.root_node,var_search)
  unless proc_search.nil?
    puts "Found : Value is #{proc_search.value}"
  else
    puts "#{var_search} Not Found ! "
  end
  puts "#{"--"*20}"

  puts "BST Sort Asc : "
  bst_object.sort_asc(bst_object.root_node)
  puts "#{"--"*20}"


  puts "BST Sort Desc : "
  bst_object.sort_desc(bst_object.root_node)
  puts "#{"--"*20}"

end

# print bst_object.root_node.inspect
 # Example Code : 

 bst_object= BST.new(12)
 bst_object.insert(bst_object.root_node,4)
 bst_object.insert(bst_object.root_node,8)
 bst_object.insert(bst_object.root_node,2)
 bst_object.insert(bst_object.root_node,20)
 bst_object.insert(bst_object.root_node,22)
 bst_object.insert(bst_object.root_node,13)
 bst_object.insert(bst_object.root_node,10)
 bst_object.insert(bst_object.root_node,3)

 bst_object.sort_asc(bst_object.root_node)
 bst_object.search(bst_object.root_node,5)
 bst_object.chap(bst_object.root_node)
 puts bst_object.root_node.left.inspect


 puts bst_object.search(bst_object.root_node,13).value
 puts root_bst.sort_desc(root_bst.root_node)
