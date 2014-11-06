# Maintainer: Vincenzo Comito <clynamen@gmail.com>
pkgname=libflycapture2
pkgver=2.7.3.13
pkgrel=1
pkgdesc="PointGrey FlyCapture SDK"
arch=('i686' 'x86_64')
url="http://ww2.ptgrey.com/sdk/FlyCap"
depends=('gtkglextmm' 'libglademm')
license=('unknown')
md5sums=('SKIP')

case $CARCH in
'x86_64')
_arch='amd64'
;;
'i686')
_arch='i386'
;;
esac

# Package download requires registration at PointGrey website
source=("flycapture2-2.7.3.13-${_arch}-pkg.tgz")

package() {
  cd ./flycapture2-2.7.3.13-${_arch}

  mkdir dest
  begin=$(pwd)
  dest=$(echo "$(pwd)/dest")
  for d in $(ls *.deb); do
    echo "extracting $d"
    mkdir tmp && cd tmp
    ar vx ../$d
    mkdir root && cd root
    tar -xvf ../data.tar.xz
    cp -r * $dest
    cd $begin
    rm -r tmp
  done

  cp -r dest/* "${pkgdir}"
}

asdf() {
grpname="pgrimaging"
UdevFile="/etc/udev/rules.d/40-pgr.rules";
echo
echo "Writing the udev rules file.";
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"2000\", MODE=\"0664\", GROUP=\"$grpname\"" 1>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"2001\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"2002\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"2003\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"2004\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"2005\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3000\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3001\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3004\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3005\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3006\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3007\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3008\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"300A\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"300B\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3100\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3101\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3102\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3103\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3104\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3105\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3106\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3107\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3108\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3109\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3300\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "KERNEL==\"raw1394\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "KERNEL==\"video1394*\", MODE=\"0664\", GROUP=\"$grpname\"" 1>>$UdevFile
echo "SUBSYSTEM==\"firewire\", GROUP=\"pgrimaging\"" 1>>$UdevFile
echo "SUBSYSTEM==\"usb\", GROUP=\"pgrimaging\"" 1>>$UdevFile
}



