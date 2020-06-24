import json

# read a json file

#need to use r no comeco da frase ou inverter aspas no windows

myjsonfile = open(r'C:/Users/elsys/Documents/pycharm_robot/rest_api/TestCase/datajson_001.json', 'r')

jsondata = myjsonfile.read()

# parse
obj = json.loads(jsondata)

first_name = (str(obj['firstName']))

last_name = (str(obj['lastName']))

address = (str(obj['address']))

print(first_name, last_name, address)

assert "Jhon" in first_name
if first_name == "Jhon":
    print("True")
else:
    print("fail")



