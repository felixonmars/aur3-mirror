# Contributor: Andrey Smirnov <Smirnov.Andrey@gmail.com>
pkgname=skytools
pkgver=2.1.4
pkgrel=1
pkgdesc="SkyTools for PostgreSQL: londsite (replication), walmgr (failover), pgqadm"
arch=(i686 x86_64)
url="https://developer.skype.com/SkypeGarage/DbProjects/SkyTools"
license=('BSD')
depends=('python' 'skytools-modules')
source=(http://pgfoundry.org/frs/download.php/1354/skytools-$pkgver.tar.gz)
md5sums=('2877393a7a78df5cead31bd1858eddc5')

build() {
  cd "$startdir/src/skytools-$pkgver"

  ./configure --prefix=/usr
  make DESTDIR="$startdir/pkg" python-all || return 1
  make DESTDIR="$startdir/pkg" python-install
}

# vim:set ts=2 sw=2 et:
