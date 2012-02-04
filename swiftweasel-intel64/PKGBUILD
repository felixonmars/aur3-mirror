# Contributor: swiftscythe <swiftscythe@gmail.com>

pkgname=swiftweasel-intel64
_pkgname=swiftweasel
pkgver=3.5.6
pkgrel=1
pkgdesc="Mozilla Firefox optimized build for Intel 64-bit processors."
arch=('x86_64')
url="http://swiftweasel.sf.net/"
license=('MPL' 'GPL' 'LGPL')
depends=(nss mozilla-common desktop-file-utils libidl2 libxcomposite xulrunner nspr)
conflicts=('swiftweasel-nocona-64' 'swiftweasel-prescott' 'swiftweasel-athlon-xp'
           'swiftweasel-pentium-4' 'swiftweasel-pentium-4m' 'swiftweasel-pentium-m'
           'swiftweasel-pentium-3')
provides=('firefox')
source=(http://download.tuxfamily.org/swiftweasel/swiftweasel-35/3.5.6-tar.gz/swiftweasel-3.5.6_intel-pgo_x86_64-arch.tar.gz
        swiftweasel.desktop
        swiftweasel-safe.desktop)
md5sums=('da083e0c9a72f3540540bb266acb9668'
         'b4d9ac75782934a4089962879f81f0ae'
         '646f04a90c467add0f61908c6ad4c3aa')

build() {
  cd $srcdir
#  mkdir $pkgdir/opt
  install -dm755 $pkgdir/opt
  cp -r $_pkgname $pkgdir/opt/$_pkgname
#  mkdir -p $pkgdir/usr/bin
  install -dm755 $pkgdir/usr/bin

  ## Fix error install.rdf
  chmod -R 755 $pkgdir/opt/$_pkgname/extensions/*

  ln -s /opt/$_pkgname/$_pkgname $pkgdir/usr/bin/$_pkgname

#  mkdir -p $pkgdir/usr/share/applications
  install -dm755 $pkgdir/usr/share/applications
#  mkdir -p $pkgdir/usr/share/pixmaps
  install -dm755 $pkgdir/usr/share/pixmaps

  install -m644 -D $srcdir/swiftweasel/icons/mozicon128.png \
	$pkgdir/usr/share/pixmaps/swiftweasel.png || return 1
  install -m644 $srcdir/swiftweasel.desktop \
	$pkgdir/usr/share/applications/ || return 1
  install -m644 $srcdir/swiftweasel-safe.desktop \
	$pkgdir/usr/share/applications/ || return 1
}
