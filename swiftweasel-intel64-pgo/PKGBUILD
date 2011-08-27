# Contributor: revel <revelΘmuub·net>

pkgname=swiftweasel-intel64-pgo
_pkgname=swiftweasel
pkgver=3.5.6
_pkgmainver=35
pkgrel=1
pkgdesc="Mozilla Firefox optimized build for Intel 64-bit processors."
arch=('x86_64')
url="http://swiftweasel.sf.net/"
license=('MPL' 'GPL' 'LGPL')
depends=(nss mozilla-common desktop-file-utils libidl2 libxcomposite xulrunner nspr)
conflicts=('swiftweasel-nocona-64' 'swiftweasel-prescott' 'swiftweasel-athlon-xp'
           'swiftweasel-pentium-4' 'swiftweasel-pentium-4m' 'swiftweasel-pentium-m'
           'swiftweasel-pentium-3')
provides=(firefox=${pkgver})
# nowadays sf.net files are out of date after a new release for quite some time
#source=(http://downloads.sourceforge.net/$_pkgname/$_pkgname-${pkgver}_intel-pgo_x86_64-arch.tar.gz
#source=(http://downloads.tuxfamily.org/$_pkgname/${_pkgname}-${_pkgmainver}/${pkgver}-tar.gz/$_pkgname-${pkgver}_intel${_pkgmainver}-pgo_x86_64-arch.tar.gz
source=(http://downloads.tuxfamily.org/$_pkgname/${_pkgname}-${_pkgmainver}/${pkgver}-tar.gz/$_pkgname-${pkgver}_intel-pgo_x86_64-arch.tar.gz
        swiftweasel.desktop
        swiftweasel-safe.desktop)
md5sums=('da083e0c9a72f3540540bb266acb9668'
	'e02fc1051ff31e05e45ec99eb38e16f6'
	'eef46b6617fb0dab69037c122793c6fb')

build() {
  cd $srcdir
#  mkdir $pkgdir/opt
  install -dm755 $pkgdir/opt || return 1
  cp -r $_pkgname $pkgdir/opt/$_pkgname || return 1
#  mkdir -p $pkgdir/usr/bin
  install -dm755 $pkgdir/usr/bin || return 1
 
  ## Fix error install.rdf
  chmod -R 755 $pkgdir/opt/$_pkgname/extensions/*

  ln -s /opt/$_pkgname/$_pkgname $pkgdir/usr/bin/$_pkgname || return 1
  
  ## Fix libxul.so symlink to reference current xulrunner version
#  msg "fixing libxul.so symlink"
#  _xulver=`LC_ALL=en_EN pacman -Qi xulrunner |grep Version |cut -d : -f 2 |cut -d - -f 1 |cut -c 2-` || return 1
#  msg "xulrunner version: $_xulver"
#  rm $pkgdir/opt/$_pkgname/libxul.so || return 1
#  ln -s /usr/lib/xulrunner-$_xulver/libxul.so $pkgdir/opt/$_pkgname/libxul.so || return 1
#  msg "libxul.so symlink FIXED"

#  mkdir -p $pkgdir/usr/share/applications
  install -dm755 $pkgdir/usr/share/applications || return 1
#  mkdir -p $pkgdir/usr/share/pixmaps
  install -dm755 $pkgdir/usr/share/pixmaps || return 1

  install -m644 -D $srcdir/swiftweasel/icons/mozicon128.png \
	$pkgdir/usr/share/pixmaps/swiftweasel.png || return 1
  install -m644 $srcdir/swiftweasel.desktop \
	$pkgdir/usr/share/applications/ || return 1
  install -m644 $srcdir/swiftweasel-safe.desktop \
	$pkgdir/usr/share/applications/ || return 1
}
