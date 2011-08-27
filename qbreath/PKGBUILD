# Maintainer: ximeg <ximeg@tomcity.ru>
# Author: Anna Medyukhina
pkgname=qbreath
pkgver=0.2
pkgrel=1
pkgdesc="Software complex for respiratory pattern analysis using wavelet and Fourier transforms."
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php?content=127554"
license=('GPL')
groups=('science')
depends=('qt')
source=("http://qt-apps.org/CONTENT/content-files/127554-$pkgname-$pkgver.tar.xz")
noextract=()
md5sums=("f73d647947b2e6e57da6c402ecdd47a0")

build() {
  cd "$srcdir/$pkgname"
  qmake
  make || return 1
  install -Dm 755 $srcdir/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
  mkdir -p $pkgdir/usr/share/$pkgname
  install -Dm 755 $srcdir/$pkgname/data/*.rsp $pkgdir/usr/share/$pkgname
  echo "**************************************
Please add your user in uucp grop
to use serial port and relogin after it.

You can find 2 example files at /usr/share/$pkgname
"
}
