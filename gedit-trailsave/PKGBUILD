# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=gedit-trailsave
pkgver=3.3.0
pkgrel=1
pkgdesc="A plugin for gedit 3 to strip trailing whitespace on save"
arch=('any')
url="https://github.com/jonleighton/gedit-trailsave"
license=('GPL')
depends=('gedit')
source=($pkgname-$pkgver.tar.gz::https://github.com/jonleighton/$pkgname/tarball/v$pkgver)
sha256sums=('14f7fcf95e29f26c95ac8b4538935bd16e8dcfb672ae7d91ff69449a2761ac3d')

package() {
  cd "$srcdir/jonleighton-$pkgname"*

  install -d "$pkgdir/usr/lib/gedit/plugins"
  install -Dm644 -t "$pkgdir/usr/lib/gedit/plugins/" trailsave.*

  # Compile Python scripts
  python -m compileall "$pkgdir"
  python -O -m compileall "$pkgdir"
}

# vim:set ts=2 sw=2 et:
