# Contributor: Stepan Litvinov <vorsk@mail.ru>

pkgname=evc
pkgver=0.1
pkgrel=1
pkgdesc="Easy Video Cutter. Select the video and cut your favorite part."
arch=('i686' 'x86_64')
license=('GPL')
#url="http://easyvideocutter.sourceforge.net/"
url="http://code.google.com/p/easyvideocutter/"
depends=('mplayer' 'qt')
#source=(http://downloads.sourceforge.net/easyvideocutter/${pkgname}-${pkgver}.tar.gz)
source=(http://easyvideocutter.googlecode.com/files/${pkgname}-${pkgver}.tar.gz evc.desktop)
md5sums=('e6e9009bc73a320987d58ca525798f0e' '1519bb670f31c69f4c17b3fde6016d18')
install=

build() {
  cd $srcdir/$pkgname-$pkgver
  qmake || return 1
  make || return 1
  install -D -m 755 $pkgname $pkgdir/usr/bin/$pkgname
  install -D -m 644 ../evc.desktop $pkgdir/usr/share/applications/evc.desktop
  install -D -m 644 $srcdir/$pkgname-$pkgver/ico/evc-128x128.png $pkgdir/usr/share/pixmaps/evc-128x128.png
}