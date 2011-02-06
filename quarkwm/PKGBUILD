# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=quarkwm
pkgver=3
_relver=200710022054
pkgrel=1
pkgdesc="A keyboard-driven, small and fast window manager designed to increase productivity."
arch=(i686 x86_64)
url="http://quarkwm.sourceforge.net/"
license=('GPL')
depends=('libx11')
makedepends=('gcc')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/quark3_${_relver}.tgz setup.patch)
md5sums=('2d80e3434e8ed7a68f472e9b5bf766e5' 'b25248f0825d22d4ceaba8f890af4e79')

build() {
  cd "$srcdir/quark3"

  # build
  patch -p0 < $srcdir/setup.patch 
  ./setup.sh

  # install binaries
  install -v -D -m 0755 qwm $pkgdir/usr/bin/qwm
  install -v -m 0755 qbar qbg qctl qform qhelp qinit qrun $pkgdir/usr/bin/

  # install docs
  install -v -d $pkgdir/usr/share/quarkwm/
  install -v -m 0644 doc/*txt $pkgdir/usr/share/quarkwm/
}

# vim:set ts=2 sw=2 et:
