# Maintainer: zlowly <zlowly@gmail.com>

pkgname=swiftweasel-intel-pgo
_pkgname=swiftweasel
_pkgmainver=35
pkgver=3.5.6
pkgrel=1
pkgdesc="Mozilla Firefox optimized build for Intel processors."
arch=('i686')
url="http://swiftweasel.tuxfamily.org"
license=('MPL' 'GPL' 'LGPL')
depends=('desktop-file-utils' 'xulrunner>=1.9.1.3 ')
conflicts=()
provides=('firefox=3.5.6')
source=(http://downloads.tuxfamily.org/$_pkgname/${_pkgname}-${_pkgmainver}/${pkgver}-tar.gz/$_pkgname-${pkgver}_intel-pgo_x86-arch.tar.gz
        swiftweasel.desktop
        swiftweasel-safe.desktop)
md5sums=('a56ce9d7ff459ae2996e1dd8f97651da'
         'e02fc1051ff31e05e45ec99eb38e16f6'
         'eef46b6617fb0dab69037c122793c6fb')
build() {
  install -dm755 $pkgdir/opt || return 1
  cp -r $_pkgname $pkgdir/opt/$_pkgname || return 1
  install -dm755 $pkgdir/usr/bin || return 1
 
  ## Fix error install.rdf
  chmod -R 755 $startdir/pkg/opt/$_pkgname/extensions/*

  ln -s /opt/$_pkgname/$_pkgname $startdir/pkg/usr/bin/$_pkgname || return 1

  install -dm755 $pkgdir/usr/share/applications || return 1
  install -dm755 $pkgdir/usr/share/applications || return 1

  install -m644 -D $srcdir/swiftweasel/icons/mozicon128.png \
	$pkgdir/usr/share/pixmaps/swiftweasel.png || return 1
  install -m644 $srcdir/swiftweasel.desktop \
	$pkgdir/usr/share/applications/ || return 1
  install -m644 $srcdir/swiftweasel-safe.desktop \
	$pkgdir/usr/share/pixmaps/ || return 1
}
