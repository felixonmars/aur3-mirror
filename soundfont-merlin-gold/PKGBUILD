# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=soundfont-merlin-gold
pkgver=1
pkgrel=1
pkgdesc="Merlin gold soundfont"
arch=(any)
url="http://ocmnet.com/saxguru/Timidity.htm#merlin"
license=(unknown)
makedepends=(sfarkxtc)
source=("http://timidity.s3.amazonaws.com/merlin_gold.sfArk")
noextract=()
md5sums=('f5b7479990ce46b0a4a9bdf8d4499071')
package() {
  cd "$srcdir"
  sfarkxtc *.sfArk
  mkdir -p "$pkgdir/usr/share/sounds/sf2/"
  cp *.sf2 "$pkgdir/usr/share/sounds/sf2/"
}

# vim:set ts=2 sw=2 et:
