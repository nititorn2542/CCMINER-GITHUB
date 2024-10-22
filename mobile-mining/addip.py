import os, time, json




def banner():
	os.system("clear")
	print("\033[1;34;40m")
	os.system("figlet -f big VERUS")
	os.system("figlet -f digital ccminer-github")
	print("\033[00m\n")
	print("\033[95mEdit by PICHET SAENGTEWAN\033[0m")
	print("\033[36m\033[0m")

def setip():


    banner()
    try:
        print("\033[93mป้อน username from github\033[00m")
        user = input("   user :  ")
        file = input("   file :  ")
        print("\033[35m-----------------------------------------\033[0m")
        
        
        if file == "":
            raise Exception()
    except:
        os.system("@cls||clear")
        print("\033[32mเกิดข้อผิดพลาดโปรดตั้งค่าใหม่\033[00m")
        time.sleep(3)
        os.system("python3 addip.py")

    push = {
        'user': user,
        'file': file
    }
    with open("setip/ip.json", "w") as set:
        json.dump(push, set, indent=4)


while True:
    banner()
    setip()
    with open("setip/ip.json",encoding="utf-8") as set:
        load = set.read()
        loads = json.loads(load)
        user = loads['user']
        file = loads['file']
        	
        print("\033[36m")
        print("username ที่บันทึก")
        print("user  =",user)
        print("file ที่เรียกใช้งาน")
        print("file  =",file)
        print("\033[0m\n")
        print("\033[31mโปรดตรวจสอบการตั้งค่า ถ้าถูกต้อง ให้ใช้คำสั่ง  run-miner  เพื่อเปิดขุด หรือ รอสักครู่ \033[0m")
        time.sleep(5)
        os.system("run-miner")
    break




