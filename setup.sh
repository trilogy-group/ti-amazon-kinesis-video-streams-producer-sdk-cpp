mkdir -p build
cd build

sudo apt-get update -y
sudo apt-get install -y libssl-dev libcurl4-openssl-dev liblog4cplus-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-base-apps gstreamer1.0-plugins-bad gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-tools

cmake .. -DBUILD_GSTREAMER_PLUGIN=TRUE -DBUILD_JNI=TRUE
make
cd ..

export GST_PLUGIN_PATH=`pwd`/build
export LD_LIBRARY_PATH=`pwd`/open-source/local/lib
echo "Echoing the stored paths -> $GST_PLUGIN_PATH $LD_LIBRARY_PATH"

echo "Verifying kvssink"
gst-inspect-1.0 kvssink
