# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=zbar-v4l
pkgver=0.10
pkgrel=1
pkgdesc="QR code & bar code reader, patched for video support"
arch=('i686' 'x86_64')
url="http://zbar.sourceforge.net/"
depends=('gtk2' 'imagemagick' 'libxv' 'python2' 'qt4')
license=('LGPL')
source=(http://downloads.sourceforge.net/project/zbar/zbar/$pkgver/zbar-$pkgver.tar.bz2
        configure.patch
        v4l1.patch)
md5sums=('0fd61eb590ac1bab62a77913c8b086a5'
         '722d96c7a0a629b946ee09ca3bbe3d10'
         'a5191f51be80fd6d136b376c18bb44ea')
sha256sums=('234efb39dbbe5cef4189cc76f37afbe3cfcfb45ae52493bfe8e191318bdbadc6'
            '11caad857877e401a803801e8486d0135bea7a98dc110e8b389121fd85ae4923'
            '051c306c2ee3d56df532c2bb66007e75be9ff2874c75890cb878132bd141c800')
conflicts=('python2-zbar' 'zbar' 'zbar-headless' 'zbar-gtk' 'zbar-qt')
provides=("zbar=$pkgver" "zbar-gtk=$pkgver" "zbar-qt=$pkgver")

build() {
  cd "$srcdir/zbar-$pkgver"

  msg 'Patching configure...'
  patch -p1 < ${srcdir}/configure.patch

  msg 'Patching v4l1.c...'
  patch -p1 < ${srcdir}/v4l1.patch

  msg 'Running configure...'
  ./configure --prefix=/usr --with-qt --with-gtk CFLAGS=-DNDEBUG

  msg 'Running make...'
  make
}

package() {
  cd "$srcdir/zbar-$pkgver"

  msg 'Installing...'
  make DESTDIR="$pkgdir" install
}
