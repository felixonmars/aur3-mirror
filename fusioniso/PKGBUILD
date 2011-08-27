# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>

pkgname=fusioniso
pkgver=0.1
_pkgrev=1164
pkgrel=1
pkgdesc="FUSE modules to mount klik files"
url="http://klik.atekon.de"
license=('GPL2')
arch=('i686')
conflicts=('klik-svn' 'klik-no-kde')
provides=('klik-svn' 'klik-no-kde')
depends=('zlib' 'fuse' 'glib2')
makedepends=('autoconf')
source=(http://intercalc.net/niall/klik/unstable/${pkgname}_${pkgver}.orig.tar.gz
  http://intercalc.net/niall/klik/unstable/${pkgname}_${pkgver}-${_pkgrev}.diff.gz)
md5sums=('7fc6a0ecac8b686a22e2fc40fdab5315' 'a4fa4db305fab05f130eecc1ceffa3c8')

build() {
  cd $startdir/src/${pkgname}-${pkgver}
  patch -p1 -i $startdir/src/${pkgname}_${pkgver}-${_pkgrev}.diff || return 1

  configure --prefix=/usr              || return 1
  make                                 || return 1
  make install DESTDIR="$startdir/pkg" || return 1
}
