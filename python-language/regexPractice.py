import re

str = 'a+_y-8 h#92'

#-- keep non aphanumeric only

# res = re.sub(r"[a-zA-Z0-9]","",str);
# print(res)

#-- keepaphanumeric only
# res = re.sub(r"[^a-zA-Z0-9]","",str);
# print(res)

#-- keepaphanumeric with spaces
# res = re.sub(r"[^a-zA-Z0-9\s]","",str);
# print(res)

#-- keepaphanumeric with spaces and _ -
# res = re.sub(r"[^a-zA-Z0-9\s_-]","",str);
# print(res)


#-- valid email

email = "yash@gmail.com"

print(re.match(r"^[a-zA-Z]+@[a-zA-Z]+\.[a-zA-Z]+$",email))

number1 = "7899900506"
print(re.match(r"^\d{10}$",number1))