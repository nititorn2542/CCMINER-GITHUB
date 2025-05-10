#!/bin/sh

# อัปเดตระบบและติดตั้งแพ็กเกจพื้นฐาน
apt-get update -y
apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential nano -y

# ให้สิทธิ์รันกับไฟล์สคริปต์
chmod +x edit-miner run-miner add-file update down-grade ANSI_Shadow.flf backup restore install.txt

# ติดตั้ง Python และไลบรารีที่จำเป็น
apt-get install python3 python3-pip wget figlet python3-progress python3-requests -y

# ติดตั้ง clang/llvm และเครื่องมือพัฒนา
apt-get install libllvm-16-ocaml-dev libllvm16 llvm-16 llvm-16-dev llvm-16-doc llvm-16-examples llvm-16-runtime \
clang-16 clang-tools-16 clang-16-doc libclang-common-16-dev libclang-16-dev libclang1-16 clang-format-16 \
python3-clang-16 clangd-16 clang-tidy-16 libclang-rt-16-dev libpolly-16-dev libfuzzer-16-dev lldb-16 lld-16 \
libc++-16-dev libc++abi-16-dev libomp-16-dev libclc-16-dev libunwind-16-dev libmlir-16-dev mlir-16-tools flang-16 \
libclang-rt-16-dev-wasm32 libclang-rt-16-dev-wasm64 -y

apt-get install clang-format clang-tidy clang-tools clang clangd libc++-dev libc++1 libc++abi-dev libc++abi1 \
libclang-dev libclang1 liblldb-dev libllvm-ocaml-dev libomp-dev libomp5 lld lldb llvm-dev llvm-runtime llvm \
python3-clang -y

# ลบไฟล์/โฟลเดอร์เก่าก่อน mv
rm -rf ../../etc/mobile-mining
rm -f ../../bin/edit-miner
rm -f ../../bin/run-miner
rm -f ../../bin/add-file
rm -f ../../bin/update
rm -f ../../bin/down-grade
rm -f ../../usr/share/figlet/ANSI_Shadow.flf
rm -f /data/data/com.termux/files/usr/bin/backup
rm -f /data/data/com.termux/files/usr/bin/restore
rm -f /storage/emulated/0/download/install.txt

# ย้ายไฟล์ใหม่ไปยังที่กำหนด
mv mobile-mining ../../etc
mv edit-miner ../../bin
mv run-miner ../../bin
mv add-file ../../bin
mv update ../../bin
mv down-grade ../../bin
mv ANSI_Shadow.flf ../../usr/share/figlet
mv backup /data/data/com.termux/files/usr/bin
mv restore /data/data/com.termux/files/usr/bin
mv install.txt /storage/emulated/0/download

# เริ่มรันสคริปต์แรก
run-miner

# ไปยังโฟลเดอร์ ccminer และคอมไพล์
cd ../../etc/mobile-mining/ccminer || exit
chmod +x build.sh configure.sh autogen.sh
CXX=clang++ CC=clang ./build.sh
chmod +x ccminer

# ลบแพ็กเกจ dev-tools เพื่อลดขนาด
cd ~
apt-get remove libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential \
libllvm16 llvm-16 llvm-16-dev llvm-16-doc llvm-16-examples llvm-16-runtime clang-16 clang-tools-16 \
clang-16-doc libclang-common-16-dev libclang-16-dev libclang1-16 clang-format-16 clangd-16 clang-tidy-16 \
libclang-rt-16-dev libpolly-16-dev libfuzzer-16-dev lld-16 libclc-16-dev libmlir-16-dev mlir-16-tools flang-16 \
libclang-rt-16-dev-wasm32 libclang-rt-16-dev-wasm64 clang-format clang-tidy clang-tools clang clangd \
libc++-dev libc++1 libc++abi-dev libc++abi1 libclang-dev libclang1 liblldb-dev libllvm-ocaml-dev libomp-dev \
libomp5 lld lldb llvm-dev llvm-runtime llvm python3-clang -y && apt-get clean

# รัน miner อีกครั้งเพื่อเริ่มงาน
run-miner
