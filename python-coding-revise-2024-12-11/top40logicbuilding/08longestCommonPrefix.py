# Thinking about logic + choosing Data Structure 
# variableToGetToAnswer and variable to store given values
# accumulator_variable
# logic + using Data Structure
# Loop termination in mind (loop termination logic)
# getting answer out through return
# thinking about edge cases


# i didnt get the logic for this question

def longest_common_prefix(strings):
  if not strings:
    return ""
  prefix = strings[0]
  for s in strings[1:]:
  
    # while s is not prefix: 
    while not s.startswith(prefix): # while not s.startswith() read again
      prefix = prefix[:-1] # start from beginning and go up to second last (dont consider the last), 
      if not prefix:
        prefix = ""
  return prefix

print(longest_common_prefix(["flower", "flow", "flight"]))  # Output: "fl"
print(longest_common_prefix(["dog", "racecar", "car"]))     # Output: ""
print(longest_common_prefix(["interview", "internet", "interval"]))  # Output: "inter"