# Coutributer: Long <long-1988@foxmail.com>
pkgname=yunio2
pkgver=2.0.2.1
pkgrel=1
epoch=
pkgdesc="Yunio Cloud Storage and Syncing to http://www.yun.io"
arch=('i686' 'x86_64')
url="http://www.yun.io"
license=("Custom:yunio")
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('yunio')
replaces=()
backup=()
options=()
install=
changelog=
if [ "$CARCH" = "i686" ]; then
    _arch='i386'
		md5sums=(
		'028f3292a27f62be638e7362e3e744e3'  
    '34fb9b39bdf3a2e24773ff1e4a620ffc')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
		md5sums=( 
		'028f3292a27f62be638e7362e3e744e3'
		'c032704b075ad370731f423d0ac60848')
fi
source=(
"http://i.minus.com/durlt7t9qpcWj.png"
"https://www.yunio.com/download/yunio-${pkgver}-generic-${_arch}.tgz")
noextract=()


package() {
    msg "Extracting the yunio package"
    tar -xvf yunio-${pkgver}-generic-${_arch}.tgz
    msg2 "Done extracting!"
    
    msg "Start installation"
    mkdir -p   $pkgdir/usr/bin
    mkdir -p   $pkgdir/usr/share/applications
    mkdir -p   $pkgdir/usr/share/icons/hicolor/64x64/apps
		cp $srcdir/durlt7t9qpcWj.png $pkgdir/usr/share/icons/hicolor/64x64/apps/yunio.png
    mv  $srcdir/yunio   $pkgdir/usr/bin/
    echo '
[Desktop Entry]
Name=Yunio
Comment=Yunio Cloud Storage
Exec=yunio
Icon=yunio.png
Terminal=0
Type=Application
Encoding=UTF-8
Categories=Network;Application;' > $pkgdir/usr/share/applications/yunio.desktop
  
  msg2 "Done!"
   
} 

yunio-2.0.2.1-generic-i386.tgz
