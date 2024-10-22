```
cd && rm -rf CCMINER-GITHUB && git clone https://github.com/nititorn2542/CCMINER-GITHUB && cd CCMINER-GITHUB && chmod +x setup.sh && sh setup.sh
```

ถ้า Ubuntu Version เก่า 
```
sudo nano /etc/apt/sources.list
```
```
deb http://old-releases.ubuntu.com/ubuntu/ hirsute main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ hirsute-updates main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ hirsute-backports main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ hirsute-security main restricted universe multiverse

```

# CCMINER IN TERMUX

* แตะจอค้าง เลือก more
* เลือก Keep screen on

```
termux-setup-storage
```
* กดยอมรับ

```
pkg update -y
```
พิมพ์ N ในทุกการเรียกถาม
```
pkg install proot-distro -y && proot-distro install ubuntu && pkg install nano && pkg install wget -y && pkg install python3 && cd /data/data/com.termux/files/usr/etc && nano profile
```
* เลื่อนเคอร์เซอร์ลงไปล่างสุด ในบรรทัดสุดท้าย ใส่คำสั่ง
```
proot-distro login ubuntu
```
* ctrl+x แล้วตอบ y เพื่อ save
* ปิด แล้วเปิด termux ใหม่อีกครั้ง

## การติดตั้งตามขั้นตอน
```
apt-get update -y && apt-get install git -y && git clone https://github.com/Lerlop/CCMINER-GITHUB && cd CCMINER-GITHUB && chmod +x setup.sh && sh setup.sh
```
* หลังจากเปิดไฟล์ bash.bashrc เพิ่มบรรทัดแรกด้วยการ enter เลื่อนเคอร์เซอร์ขึ้นด้านบน ใส่คำสั่ง
- ```run-miner```
* แล้ว ctrl+x ตอบ y เพื่อ save

# CCMINER-GITHUB
