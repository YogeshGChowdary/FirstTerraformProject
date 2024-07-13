# concat(list1,list2,---): Combines multiple lists into a single list

variable "list1" {
  type = list
  default = ["a", "b"]
}

variable "list2" {
  type = list
  default = ["c", "d"]
}

output "combined_list" {
  value = concat(var.list1, var.list2)
}

# output = ["a","b","c","d"]
#  --------------------------------------------------------------------

#element(list,index):  Returns the element at the specified index in a list.

variable "my_list" {
  type = list
  default = ["apple", "banana", "cherry"]
}

output "selected_element" {
  value = element(var.my_list,1)   # returns apple
}

# ----------------------------------------------------------------------------

# length(list) : returns the no. of elements in the list

variable "my_list" {
  type = list
  default = ["apple", "banana", "cherry"]
}

output "list_length" {
  value = length(var.my_list)  # returns 3
}

# ------------------------------------------------------------------------------

# map(key,value): create a map from a list of keys and a list of values

variable "keys" {
  type = list
  default = ["name", "age"]
}

variable "values" {
  type = list
  default = ["Alice", "30"]
}

output "my_map" {
  value = map(var.keys,var.values) # Returns {"name" = "Alice", "age" = 30}
}

# -------------------------------------------------------------------------

# lookup(map,key): retrieves value associated with a specific key in a map

variable "my_map" {
  type = map(string)
  default = {
    "name" = "Alice" , "age" = "30"
  }
}

output "value" {
  value = lookup(var.my_map, "name") # Returns "Alice"
}

# -------------------------------------------------------------------------

# join(separator,list): Joins the elements of a list into a single string using the specified separator.

variable "my_list" {
  type = list
  default = ["apple", "banana", "cherry"]
}

output "joined_string" {
  value = join(",", var.my_list)  # Returns "apple, banana, cherry"
}