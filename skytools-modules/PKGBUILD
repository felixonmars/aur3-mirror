# Contributor: Andrey Smirnov <Smirnov.Andrey@gmail.com>
pkgname=skytools-modules
pkgver=2.1.4
pkgrel=1
pkgdesc="SkyTools modules for PostgreSQL: txid, logtriga, logutriga, londsite, pgq"
arch=(i686 x86_64)
url="https://developer.skype.com/SkypeGarage/DbProjects/SkyTools"
license=('BSD')
depends=('postgresql' 'postgresql-plpythonu')
source=(http://pgfoundry.org/frs/download.php/1354/skytools-$pkgver.tar.gz)
md5sums=('2877393a7a78df5cead31bd1858eddc5')

build() {
  cd "$startdir/src/skytools-$pkgver"

  ./configure --prefix=/usr
  make DESTDIR="$startdir/pkg" modules-all || return 1
  make DESTDIR="$startdir/pkg" modules-install
}

# vim:set ts=2 sw=2 et:
