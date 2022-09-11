
import requests
from string import ascii_uppercase

ipAddress = 'http://129.213.87.202:3000/api/%s'
#ipAddress = 'http://localhost:3000/api/%s'
url = ipAddress % 'org.example.biznet.Trader'
url2 = ipAddress % 'org.example.biznet.Property'
url3 = ipAddress % 'org.example.biznet.Trade'
url4 = ipAddress % 'org.example.biznet.Package'
url5 = ipAddress % 'org.example.biznet.Transfer'
url6 = ipAddress % 'org.example.biznet.CreatePackage'
url7 = ipAddress % 'org.example.biznet.UnboxPackage'
lib = {'lat': 29.721143, 'long': -95.342147}
gar = {'lat': 29.725155, 'long': -95.347762}
cbb = {'lat': 29.721540, 'long': -95.340258}
pgh = {'lat': 29.721553, 'long': -95.343587}

def makeTrader(i, fname, lname):
    print("Making %s %s" % (fname, lname))
    data = { 
        "$class": "org.example.biznet.Trader", 
        "traderId": "TRADER%s" % i, 
        "firstName": fname, 
        "lastName": lname 
    }
    response = requests.post(url,data=data)

def makeTraders():
    makeTrader("NULL","NULL","NULL")
    with open("traders.txt","r") as file:
        for line in file:
            split = line.split(" ")
            makeTrader(split[0],split[1],split[2].rstrip('\n'))

def makeProperty(i, description, ownerId):
    print("Making property %s" % i)
    data = {
        "$class": "org.example.biznet.Property", 
        "PropertyId": "Property %s" % i, 
        "description": description, 
        "owner": "TRADER%d" % ownerId
    }
    result = requests.post(url2,data=data)

def makeProperties():
 #   for i in ascii_uppercase:
  #      makeProperty(i,
   #                  "Test description",
    #                 ord(i)%5+1)
    makeProperty("A","Test description", 1)
    makeProperty("B","Test description", 1)
    makeProperty("C","Test description", 1)
    makeProperty("D","Test description", 1)
    makeProperty("E","Test description", 1)
    makeProperty("F","Test description", 1)

def makeTransaction(propId, t1id, t2id, latitude, longitude): 
    print("Sending %s to %s" % (propId, t2id))
    data = {
        "property" : propId,
        "origOwner" : t1id,
        "newOwner" : t2id,
        "latitude" : latitude,
        "longitude" : longitude,
    }
    result = requests.post(url3, data=data)

def makePackage(packId, sender, recipient, contents):
    data ={
	"packageId": packId,
	"sender": sender,
	"recipient": recipient,
	"contents": contents
    }
    result = requests.post(url6, data=data)
    print(result.content)

def makeTransfer(packId, origOwner, newOwner, latitude, longitude): 
    print("Sending %s to %s" % (packId, newOwner))
    data = {
        "package" : packId,
        "origHandler" : origOwner,
        "newHandler" : newOwner,
        "latitude": latitude,
        "longitude": longitude
    }
    result = requests.post(url5, data=data)
    print(result.content)


def makeTrans(packId, origOwner, newOwner, place):
    makeTransfer(packId,origOwner,newOwner,place['lat'],place['long'])

def openPackage(packId, recipient):
    data = {
        "package": packId,
        "recipient": recipient
    }
    result = requests.post(url7, data=data)
    print(result)

def makeTransactions():
    makeTransaction("Property A", "TRADER1", "TRADER2", 29.721115, -95.342308)
    makeTransaction("Property A", "TRADER2", "TRADER1", 29.722037, -95.349048)
    makeTransaction("Property A", "TRADER1", "TRADER3", 29.725520, -95.348388)
	