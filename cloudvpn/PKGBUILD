# Contributor: Andrew Kopplin <revrollic+aur@gmail.com>
# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=cloudvpn
pkgver=1.99.8
pkgrel=4
pkgdesc="Small and secure SSL-based mesh networking tool."
arch=('i686' 'x86_64')
url="http://dev.e-x-a.org/projects/cloudvpn/wiki/"
license=('GPL3')
depends=('gnutls')
source=(http://dev.e-x-a.org/attachments/download/1/${pkgname}-${pkgver}.tar.bz2)
md5sums=('fadda43db412d81fa5b775f0ea588ad7')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh 
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir/ install
  install -Dm644 README $pkgdir/usr/share/doc/cloudvpn/README
}

# vim:set ts=2 sw=2 et:
