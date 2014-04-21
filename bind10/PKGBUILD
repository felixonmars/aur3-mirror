# Maintainer: Sébastien Luttringer <seblu@seblu.net>

pkgname=bind10
pkgver=1.2.0
pkgrel=1
pkgdesc='Next generation of ISC BIND and DHCP server'
arch=('i686' 'x86_64')
url='http://bind10.isc.org'
license=('custom')
makedepends=('boost')
depends=('boost-libs' 'python' 'botan' 'python-setproctitle' 'log4cplus')
backup=('etc/bind10/cmdctl-certfile.pem'
        'etc/bind10/cmdctl-keyfile.pem')
options=('!makeflags')
source=("ftp://ftp.isc.org/isc/bind10/$pkgver/bind10-$pkgver.tar.gz")
md5sums=('69456d8a8a44ea7840d673acf71457ae')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  # symlink license
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -s ../../doc/$pkgname/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
