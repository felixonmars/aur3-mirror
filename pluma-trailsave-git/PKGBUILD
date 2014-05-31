# PKGBUILD for pluma-trailsave-git
pkgname=pluma-trailsave-git
pkgver=20140529
pkgrel=1
arch=any
url="http://github.com/daggerbot/pluma-trailsave"
license=(zlib)
depends=(pluma)
makedepends=(git)
conflicts=(pluma-trailsave)

build() {
  cd "$srcdir"
  git clone "https://github.com/Daggerbot/pluma-trailsave.git"
}

package() {
  mkdir -p "$pkgdir/usr/lib/pluma/plugins"
  cp -f "$srcdir/pluma-trailsave/trailsave.pluma-plugin" "$pkgdir/usr/lib/pluma/plugins"
  cp -f "$srcdir/pluma-trailsave/trailsave.py" "$pkgdir/usr/lib/pluma/plugins"
}
