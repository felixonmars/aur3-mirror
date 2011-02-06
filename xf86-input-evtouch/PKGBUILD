# Contributor: Giuseppe Borzi <gborzi@ieee.org>
pkgname=xf86-input-evtouch
pkgver=0.8.8
pkgrel=7
pkgdesc="Input driver for Linux event touchscreens"
arch=('i686' 'x86_64')
url="http://www.conan.de/touchscreen/evtouch.html"
license=('GPL')
depends=('libx11')
makedepends=('xorg-server-devel>=1.9.0')
options=(!libtool)
install=$pkgname.install
source=(http://www.conan.de/touchscreen/$pkgname-$pkgver.tar.bz2 debian_patches.diff calibrate_patch.diff xorg1.7_patch.diff buttonless_patch.diff 50-evtouch.conf)
md5sums=('4d8e092356d8353002f60a4907046c13'
         '8ed0a13041b055cd9cc37c9a503d4ec5'
         '3f947e5745656511ec9af526c40ca0e5'
         'c23cee8f554e5c2ca356491ab04ccd8c'
         '2d27ba7bba352ec5e60be22ae3fcfd83'
         '111549d6a6cbe9d8ebf64fd9d1a3a519')


build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 -i $srcdir/debian_patches.diff
  patch -Np0 -i $srcdir/calibrate_patch.diff
  patch -Np0 -i $srcdir/xorg1.7_patch.diff
  # People with a button device may want to disable this patch
  patch -Np1 -i $srcdir/buttonless_patch.diff
  ./configure --prefix=/usr --sysconfdir=/etc --enable-evcalibrate --enable-udevinstall
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/etc/X11/xorg.conf.d
  install -m644 $srcdir/50-evtouch.conf $pkgdir/etc/X11/xorg.conf.d
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -m644 README.calibration $pkgdir/usr/share/doc/$pkgname
}
