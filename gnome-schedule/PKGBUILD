# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=gnome-schedule
pkgver=2.2.0
pkgrel=2
pkgdesc="A graphical interface to crontab and at for GNOME"
arch=('any')
url="http://gnome-schedule.sourceforge.net/"
license=('GPL')
depends=('python2-gconf' 'at' 'gnome-terminal')
makedepends=('intltool' 'gnome-doc-utils')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        drop-gnome-python.patch)
md5sums=('5036cc2508b58a86b6c70e2f33030c65'
         '4d7bf1dd37fb012b9db87fad2ae16947')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/drop-gnome-python.patch"

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
