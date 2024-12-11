str = "yashvardhan"

def first_non_repeating_char(str):
  char_count = {}
  for char in str:
    char_count[char]=1+char_count.get(char,0);
  for key,value in char_count.items():
    if value==1:
      return key
  return None # i had not written it explicitly

""" 
# anothe logic
    for char in s:
        if char_count[char] == 1:
            return char
"""

print(first_non_repeating_char("swiss"))    # Output: "w"
print(first_non_repeating_char("aabbcc"))   # Output: None
print(first_non_repeating_char("abcdef"))   # Output: "a"

