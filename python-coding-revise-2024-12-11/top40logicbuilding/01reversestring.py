# abc
# a
# b+a
# c+b+a

def reverse_string(str):
  reversed_str =""
  for char in str:
    reversed_str=char+reversed_str
  return reversed_str

print(reverse_string("hello"))  # Output: "olleh"
print(reverse_string(""))       # Output: ""
print(reverse_string("a"))      # Output: "a"


