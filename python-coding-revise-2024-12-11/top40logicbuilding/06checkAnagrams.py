# Thinking about logic + choosing Data Structure 
# variableToGetToAnswer
# accumulator_variable
# logic + using Data Structure
# Loop termination in mind (loop termination logic)
# getting answer out through return
# thinking about edge cases


def are_anagrams(str1,str2):
  # had missed handling both edge cases earlier. 

  str1 = str1.replace(" ","").lower()
  str2 = str2.replace(" ","").lower()
  # should filter first

  if len(str1)!= len(str2):
    return False
  # str1 = str1.replace(" ","").lower()
  # str2 = str2.replace(" ","").lower()
  str1Map = {}
  str2Map = {}
  for char in str1:
    str1Map[char]=1+str1Map.get(char,0);
  for char in str2:
    str2Map[char]=1+str2Map.get(char,0);
  return str1Map == str2Map

print(are_anagrams("listen", "silent"))      # Output: True
print(are_anagrams("Hello", "Olelh"))        # Output: True
print(are_anagrams("Dormitory", "Dirty Room"))  # Output: True
print(are_anagrams("Python", "Java"))        # Output: False

# True
# False // lower case not handled
# False //space not handled
# False

## Didnt get the right solution