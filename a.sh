# apt install git python3 -y
git clone https://chromium.googlesource.com/chromium/tools/depot_tools -b main
export PATH=$PATH:$(pwd)/depot_tools
git checkout 4a03d61accede9dd0e3e6dc0456ff5a0e3f792b4
git pull
tools/dev/gm.py x64.release;
pwd;
ls
