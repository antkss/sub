echo "deb http://ftp.de.debian.org/debian bullseye main " >> /etc/apt/sources.list
echo " deb http://security.debian.org/debian-security bullseye-security main " >> /etc/apt/sources.list
apt update 
apt install meson pkg-config python3.9 bear -y
ln -s /usr/bin/python3.9 /usr/bin/python3 -f 
ln -s /usr/bin/python3.9 /usr/bin/python -f
wget "https://github.com/antkss/sub/raw/refs/heads/master/iculib.tar.xz"
tar -xf iculib.tar.xz
cp -r iculib/usr /
wget "https://github.com/antkss/sub/raw/refs/heads/master/libxml.tar.xz"
tar -xf libxml.tar.xz
cp -r libxml/usr /
git clone https://chromium.googlesource.com/chromium/tools/depot_tools -b main
export PATH=$PATH:$(pwd)/depot_tools
fetch v8
cd v8
git checkout 4a03d61accede9dd0e3e6dc0456ff5a0e3f792b4
gclient sync
gn gen x64.debug
cd x64.debug
echo "is_component_build = false
is_debug = false
target_cpu = \"x64\"
v8_enable_sandbox = true

v8_enable_backtrace = true
v8_enable_disassembler = true
v8_enable_object_print = true
v8_enable_verify_heap = true

v8_enable_memory_corruption_api = true
" > args.gn

# ninja
cd ..
bear -- autoninja -C x64.debug
mv compile_commands.json x64.debug
tar -cJf v8build.tar.xz x64.debug
mv v8build.tar.xz /
