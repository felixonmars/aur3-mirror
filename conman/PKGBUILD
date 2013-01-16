# Maintainer: TDY <tdy@archlinux.info>

pkgname=conman
pkgver=0.2.7
pkgrel=1
pkgdesc="A serial console management program designed to support a large number of console devices and simultaneous users"
arch=('i686' 'x86_64')
url="https://code.google.com/p/conman/"
license=('GPL3')
depends=('perl')
install=$pkgname.install
source=(https://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.bz2
        $pkgname.rc
        $pkgname.service)
md5sums=('9b44c2ff71fd373dd089569aa7717e14'
         '56afaaa90f95fc9738ffbf8f7c69772e'
         'cbef56433a947157d520331093acb3b9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/init\.d/rc.d/; s/600/644/' Makefile.in
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm755 ../$pkgname.rc "$pkgdir/etc/rc.d/$pkgname"
  install -Dm644 ../$pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

# vim:set ts=2 sw=2 et:
