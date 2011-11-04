# Contributor: royrocks <royrocks13@gmail.com>
pkgname=tuxpaint-stamps
pkgver=2009.06.28
pkgrel=2
pkgdesc="Additional stamps for Tux Paint"
arch=(i686 x86_64)
url="http://www.tuxpaint.org"
license=('GPL')
depends=(tuxpaint)
optdepends=(tuxpaint-config)
provides=(tuxpaint-stamps-cvs)
conflicts=(tuxpaint-stamps-cvs)
source=(http://downloads.sourceforge.net/tuxpaint/$pkgname-$pkgver.tar.gz
        fixcompilation.patch)
md5sums=('06ceccd22074bdbf95c7c8776f7f49a9'
         '0849ec69e132f86f8dc527e0a3a4d07f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  #sed -i 's+/usr/local+/usr+g' Makefile || return 1
  
  patch -Np1 -i ${srcdir}/fixcompilation.patch || return 1

  make PREFIX=/usr || return 1
  make DATA_PREFIX=$pkgdir/usr/share/tuxpaint/ install-all || return 1
}

# vim:set ts=2 sw=2 et:
