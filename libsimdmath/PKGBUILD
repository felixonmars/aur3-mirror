# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: demonicmaniac <stormtrooperofdeath@gmx.net>
pkgname=libsimdmath
pkgver=1
pkgrel=1
epoch=
pkgdesc="universal simd math library"
arch=('i686' 'x86_64')
url="http://webuser.hs-furtwangen.de/~dersch/"
license=('GPL3')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://webuser.hs-furtwangen.de/~dersch/libsimdmath.tar.gz
        patch1
        patch2)
noextract=()
md5sums=() #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname"

  patch -p1 < ../patch1
  patch -p1 < ../patch2
  make
}

package() {
  cd "$srcdir/$pkgname/lib"
  install -dm755 ${pkgdir}/usr/{lib,include/libsimdmath,share/doc/libsimdmath}
  install -m644 libsimdmath.a ${pkgdir}/usr/lib/
  install -m644 *.h ${pkgdir}/usr/include/libsimdmath/
  install -m644 ../libsimdmath.pdf ${pkgdir}/usr/share/doc/
  
  
}

# vim:set ts=2 sw=2 et:
md5sums=('0fe6f0e9ff6b9ce92bdd263c38165c6d'
         '51f2c697f6336c3791d59a69816a44b1'
         '7cbc40b5b72d163da16fca9c7c11c118')
