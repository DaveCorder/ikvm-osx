# ikvm-osx

How to setup and use Avocent virtual KVM and virtual media functionality for ASpeed BMCs.

Tested to work with ast2300 on Gigabyte GA-7PESH2 motherboard with BMC version 2.35 and OS X High Sierra 10.13.6

Based on [IDRAC6 Virtual Console Launcher
](https://gist.github.com/xbb/4fd651c2493ad9284dbcb827dc8886d6)

# Install Java

Install the legacy Java 6 runtime from Apple, [Java for OS X 2017-001](https://support.apple.com/kb/dl1572?locale=en_US)

# Create folder to hold everything

```
mkdir ~/vkvm
cd ~/vkvm
```

# Create java symlink

```
ln -s /Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home jre
```

# Fetch the jar files from the IPMI server

You can find these URLs by attempting to use the vKVM functionality by clicking the "Launch Java KVM Client" button in the web UI, and then reading the .JNLP file that gets downloaded.

```
curl -O http://your-ipmi-IP-address:80/software/avctKVMIOMac64.jar
curl -O http://your-ipmi-IP-address:80/software/avctVMMac64.jar
curl -O http://your-ipmi-IP-address:80/software/avctKVM.jar
curl -O http://your-ipmi-IP-address:80/software/avctVM.jar

```

# Extract the jar files

They're really just .zip files.

```
unzip -d avctKVMIOMac64 avctKVMIOMac64.jar
unzip -d avctVMMac64 avctVMMac64.jar
```

# Grab the appropriate JNI libraries

```
mkdir lib
cd lib
cp ../avctKVMIOMac64/libavctKVMIO.jnilib .
cp ../avctVMMac64/libavmMac.jnilib .
```

# Run the appropriate script

Pass the hostname/IP address as the first parameter and your IPMI username as the second parameter. The script will prompt for your password.

## Virtual Console

```
./start-virtual-console.sh your-ipmi-IP-address username
```

## Virtual Media

```
./start-virtual-media.sh your-ipmi-IP-address username
```

# Feedback

Looking for more info on BMCs/OS/Java version combinations that work and don't work.

Send feedback to dcorder@gmail.com or through Git messages. Got an improvement? Send a pull request.