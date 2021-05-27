import mysql.connector #sudo python3 -m pip install mysql-connector-python


#database connection config
application = mysql.connector.connect(
  host="localhost",
  user="api",
  password="password",
  database="CSC315Final2021" #database name
)

#buffered database
cursor = application.cursor(buffered=True) #make database instance





#code
application.commit()

print("Application")

choice = -1
user = False
while not user:
    try:
        user_id = input("Please enter the User ID: ")
        cursor.execute("SELECT uid FROM Users WHERE uid={};".format(user_id))
        user = True
    except mysql.connector.Error as err:
        print("User not found! Please enter a valid User ID!")
        
cursor.execute("SELECT u_name FROM Users WHERE uid={};".format(user_id))
#save all the data in var called select
select = cursor.fetchall()
#loop through select to print the data
for row in select:
    for field in row:
        print("Name: {}".format(field))
        
def choice1(): #create a new user
    print("Create New User: \n")
    success = False
    while not success:
        try:
            name = input("Enter user's name: ")
            home_country = input("Enter user's home country (1. Central Asia, 2. Europe, 3. North America, 4. South America: ")
            cursor.execute("INSERT INTO Users(u_name, rid) VALUES ({},{});".format(name, home_country))
            application.commit()
            success = True
            print("User created successfully!\n")
        except mysql.connector.Error as err:
            print("Please enter valid country number\n")
        
def choice2(): #Task 4
    cursor.execute("SELECT R.rname, S.sgname FROM Sub_Genre S JOIN Region R ON S.sgid = R.rid;")
    #save all the data in var called select
    select = cursor.fetchall()
    #loop through select to print the data
    for row in select:
        print("Region Name: {}".format(row[0]))
        print("Sub Genre Name: {}".format(row[1]))
        print("\n")
        
def choice3(): #Task 5
    cursor.execute("SELECT S.sgname, S.bname FROM Band_Styles S WHERE S.boid IN(SELECT B.boid FROM Band_Styles B JOIN Favorites F ON B.boid = F.bid WHERE F.uid =3) AND S.boid NOT IN(SELECT B.boid FROM Band_Styles B JOIN Favorites F ON B.boid = F.bid WHERE F.uid = {});".format(user_id))
    #save all the data in var called select
    select = cursor.fetchall()
    #loop through select to print the data
    for row in select:
        print("Sub Genre Name: {}".format(row[0]))
        print("Band Name: {}".format(row[1]))
        print("\n")
        
def choice4(): #Task 6
    cursor.execute("SELECT G.bname, G.gname FROM Band_Genre G WHERE G.bgid IN(SELECT B.bgid from Band_Genre B JOIN Favorites F on B.bgid = F.bid WHERE F.uid = 3)AND G.bgid NOT IN(SELECT Bg.bgid from Band_Genre Bg JOIN Favorites F on Bg.bgid = F.bid WHERE F.uid = {});".format(user_id))
    #save all the data in var called select
    select = cursor.fetchall()
    #loop through select to print the data
    for row in select:
        print("Genre Name: {}".format(row[0]))
        print("Band Name: {}".format(row[1]))
        print("\n")
        
def choice5(): #Task 7
    cursor.execute("SELECT Favorites.uid, Favorites.bid FROM Favorites WHERE Favorites.uid IN(SELECT DISTINCT FS.uid FROM Favorites FS WHERE FS.bid IN(SELECT F.bid FROM Favorites F WHERE uid = {}));".format(user_id))
    #save all the data in var called select
    select = cursor.fetchall()
    #loop through select to print the data
    for row in select:
        print("User ID: {}".format(row[0]))
        print("Band ID: {}".format(row[1]))
        print("\n")
        
def choice6(): #Task 8
    cursor.execute("SELECT DISTINCT cname FROM Country WHERE rid NOT IN(Select rid FROM Users WHERE uid = {} order by 1);".format(user_id))
        #save all the data in var called select
    select = cursor.fetchall()
    #loop through select to print the data
    for row in select:
        print("Country Name: {}".format(row[0]))
        print("\n")
        
def choice7():
    print("Add Favorites: \n")
    success = False
    while not success:
        try:
            uid = input("Enter user's id: ")
            bid = input("Enter band's id: ")
            cursor.execute("INSERT INTO Favorites(uid,bid) VALUES({}, {});".format(uid, bid))
            application.commit();
            success = True
        except mysql.connector.Error as err:
            print("Please enter valid user/band id\n")

def choice8():
    print("Remove Favorites: \n")
    success = False
    while not success:
        try:
            uid = input("Enter user's id: ")
            bid = input("Enter band's id: ")
            cursor.execute("DELETE FROM Favorites WHERE uid={} AND bid={};".format(uid, bid))
            application.commit();
            success = True
        except mysql.connector.Error as err:
            print("Please enter valid user/band id\n")

while choice != 9:
    print("Choose an operation: \n1. Create user \n2. Show Sub Genres with Region \n3. Show Bands not in Favorite/Same Sub Genres \n4. Show Bands not in Favorite/Same Genres \n5. Show users who have same Band \n6. Find Bands based on Region \n7. Add Favorites \n8. Remove Favorites \n9. Exit")

    choice = input("Enter number of operation: ")
    choice = int(choice)
    print("\n")
    
    if choice == 1:
        choice1()
    elif choice == 2:
        choice2()
    elif choice == 3:
        choice3()
    elif choice == 4:
        choice4()
    elif choice == 5:
        choice5()
    elif choice == 6:
        choice6()
    elif choice == 7:
        choice7()
    elif choice == 8:
        choice8()
    elif choice == 9:
        print("Exiting....")
        #close application
        application.close()
        exit()
        
