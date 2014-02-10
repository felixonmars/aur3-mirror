# Maintainer: Zach Jaggi <feilen1000@gmail.com>

pkgname=vrchat
pkgver=0.3.0
pkgrel=1
arch=('i686' 'x86_64')
license=('unknown')
pkgdesc="Chat about VR, in VR!"
depends=('openal>=1.14')
url="http://grahamgaylor.com"
source=("${pkgname}_${pkgver}.zip"::"https://dl.dropboxusercontent.com/s/03qjnf75pcaltsk/VRChat_Linux%28U%29.zip"
        vrchat.sh)
noextract=("${pkgname}_${pkgver}.zip")
md5sums=('SKIP'
         'SKIP')
optdepends=('oculus-udev: Udev rule for Oculus Rift')

prepare() {
    cd $srcdir
    mkdir -p $pkgname
    unzip ${pkgname}_${pkgver}.zip -d $srcdir/$pkgname
}

package() {
  cd $srcdir/$pkgname
  install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -dm777 -g games $pkgdir/opt/$pkgname
  cp -dr --no-preserve=ownership $srcdir/$pkgname/* $pkgdir/opt/$pkgname
  chmod 777 -R $pkgdir/opt/$pkgname # Unfortunately appears to be the only way it'll update correctly.
}
