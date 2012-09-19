# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Mike Lenzen <lenzenmi@gmail.com>
pkgname=stellarforces
pkgver=1.87
pkgrel=1
pkgdesc="Stellar Forces is a 3D squad-level multi-player turn-based strategy game"
arch=(any)
url="http://www.stellarforces.com/"
license=('GPL')
depends=('java-environment' 'lib32-libxrandr' 'lib32-libxcursor' 'libxxf86vm' 'lib32-gcc-libs')
makedepends=('unzip')
install=stellarforces.install
source=("http://stellarforces.googlecode.com/files/stellar_forces_client.tar.bz2" 
  'stellarforces.sh'
  'stellarforces.install')
md5sums=('4e6663be576edad747fd4d5cc00f949c'
         'cdd6d3f2d104f57d4af3335cca91a29e'
         '39ba214e9234bae0809ed006a7b0566e')
build() {
  cd "$srcdir"
}

package() {
  mkdir -p "$pkgdir/usr/share/java/$pkgname" \
           "$pkgdir/usr/bin/"
  cp -ar  $srcdir/stellar_forces_client/* "$pkgdir/usr/share/java/$pkgname/"
  install -Dm755 "$srcdir/stellarforces.sh" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
