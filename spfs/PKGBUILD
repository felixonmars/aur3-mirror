# Maintainer: Michal Kowalski <kowalski TOD michal TA gmail TOD com>

pkgname=spfs
pkgver=0.2
pkgrel=3
pkgdesc="Library for writing 9P2000 compliant user-space file servers that can be mounted using v9fs file system"
arch=('i686')
url="http://sourceforge.net/projects/npfs/"
license=('BSD')
depends=()
makedepends=()
optdepends=('plan9port: the whole, useless Plan 9 shabang')
provides=('v9fs-server')
backup=('etc/conf.d/spfs.conf')
source=("http://downloads.sourceforge.net/project/npfs/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz" README spfs-install.patch spfs-rc.script spfs-conf.script)
md5sums=('2ae13d7454f4b3c6c8501ad74a113e56' '50053e6039d205158cc43873bbe8b330' '9a66cb801a9c2826376fbeaf4486c298' '21f7cf0db27498849ca1d7a889ad393d' '4c6b70e8b34878e96a87c20d5f98247b')

build() {
  cd "$srcdir/$pkgname"
  patch -p1 < ../spfs-install.patch

  make
}

package() {
  cd "$srcdir/$pkgname"

  make INSTALLPREFIX="$pkgdir/usr" install

  mkdir -p "$pkgdir/etc/rc.d"
  cp ${srcdir}/spfs-rc.script ${pkgdir}/etc/rc.d/spfs
  chmod +x $pkgdir/etc/rc.d/spfs
  mkdir -p "$pkgdir/etc/conf.d"
  cp ${srcdir}/spfs-conf.script ${pkgdir}/etc/conf.d/spfs.conf
}

# vim:set ts=2 sw=2 et:
