# Arlekino <arlekino.zirk@gmail.com>

pkgname=swiftweasel-amd64-k10-pgo
_pkgname=swiftweasel
pkgver=3.5.6
pkgrel=1
pkgdesc="Mozilla Firefox optimized build for AMD K10 genaration (Phenom) processors (64 bit version)."
arch=('x86_64')
url="http://swiftweasel.tuxfamily.org/"
license=('MPL' 'GPL' 'LGPL')
depends=(nss mozilla-common desktop-file-utils libidl2 libxcomposite xulrunner nspr)
conflicts=()
provides=(firefox)

source=(http://download.tuxfamily.org/swiftweasel/swiftweasel-35/${pkgver}-tar.gz/swiftweasel-${pkgver}_amd_K10-pgo_x86_64-arch.tar.gz
        swiftweasel.desktop
        swiftweasel-safe.desktop)

build() {
 
  install -dv $pkgdir/{opt,usr/bin}
  cp -r $srcdir/swiftweasel $pkgdir/opt
  ln -s /opt/swiftweasel/swiftweasel /$pkgdir/usr/bin/swiftweasel


  ## Fix error install.rdf
  chmod -R 755 $pkgdir/opt/$_pkgname/extensions/*


  install -m644 -Dv $srcdir/swiftweasel/icons/mozicon128.png \
	$pkgdir/usr/share/pixmaps/swiftweasel.png || return 1
  install -m644 -Dv $srcdir/swiftweasel.desktop \
	$pkgdir/usr/share/applications/swiftweasel.desktop || return 1
  install -m644 -v $srcdir/swiftweasel-safe.desktop \
	$pkgdir/usr/share/applications/ || return 1
}

md5sums=('a9f2248d9c48aaa974af36643726bc1a'
         'e02fc1051ff31e05e45ec99eb38e16f6'
         'eef46b6617fb0dab69037c122793c6fb')
