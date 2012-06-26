# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=soundfont-merlin-vienna
pkgver=1
pkgrel=1
pkgdesc="Merlin vienna soundfont"
arch=(any)
url="http://ocmnet.com/saxguru/Timidity.htm#merlin"
license=(unknown)
makedepends=(sfarkxtc)
source=("http://timidity.s3.amazonaws.com/merlin_vienna.sfArk")
noextract=()
md5sums=('e35d36bf576e8b2e7883f916801f10d3')
package() {
  cd "$srcdir"
  sfarkxtc *.sfArk
  mkdir -p "$pkgdir/usr/share/sounds/sf2/"
  cp *.sf2 "$pkgdir/usr/share/sounds/sf2/"
}

# vim:set ts=2 sw=2 et:
