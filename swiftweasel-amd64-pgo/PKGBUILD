# Maintainer: speed145a/Jonny James <speed145a@aol.com>
# Contributor: Yuanhao Li<yuanhao.li@gmail.com>

pkgname=swiftweasel-amd64-pgo
_pkgname=swiftweasel
pkgver=3.5.6
pkgrel=1
pkgdesc="Mozilla Firefox optimized build for AMD 64-bit processors (64 bit version)."
arch=('x86_64')
url="http://swiftweasel.tuxfamily.org/"
license=('MPL' 'GPL' 'LGPL')
depends=(nss mozilla-common desktop-file-utils libidl2 libxcomposite)
conflicts=('swiftweasel-nocona-64' 'swiftweasel-prescott' 'swiftweasel-athlon-xp' \
           'swiftweasel-pentium-4' 'swiftweasel-pentium-4m' 'swiftweasel-pentium-m' \
           'swiftweasel-pentium-3' 'swiftweasel-athlon64')
provides=('firefox')

source=(http://download.tuxfamily.org/swiftweasel/swiftweasel-35/${pkgver}-tar.gz/swiftweasel-${pkgver}_amd-pgo_x86_64-arch.tar.gz
        swiftweasel.desktop
        swiftweasel-safe.desktop)
md5sums=('5f4d83122f2686d65c91c67191f0f378'
         'e02fc1051ff31e05e45ec99eb38e16f6'
         'eef46b6617fb0dab69037c122793c6fb')

build() {
  cd $srcdir
  install -dm755 $pkgdir/opt
  cp -r $_pkgname $pkgdir/opt/$_pkgname
  install -dm755 $pkgdir/usr/bin
 
  ## Fix error install.rdf
  chmod -R 755 $pkgdir/opt/$_pkgname/extensions/*

  ln -s /opt/$_pkgname/$_pkgname $pkgdir/usr/bin/$_pkgname

  install -dm755 $pkgdir/usr/share/applications
  install -dm755 $pkgdir/usr/share/pixmaps

  install -m644 -D $srcdir/swiftweasel/icons/mozicon128.png \
	$pkgdir/usr/share/pixmaps/swiftweasel.png || return 1
  install -m644 $srcdir/swiftweasel.desktop \
	$pkgdir/usr/share/applications/ || return 1
  install -m644 $srcdir/swiftweasel-safe.desktop \
	$pkgdir/usr/share/applications/ || return 1
}
