# PKGBUILD for pluma-trailsave-notcur
pkgname=pluma-trailsave-notcur
pkgver=1.0
pkgrel=1
pkgdesc="Pluma plugin that strips trailing spaces when saving (except on the current line)"
arch=(i686 x86_64)
url="http://www.github.com/daggerbot/pluma-trailsave"
license=('zlib')
depends=('pluma>=1.8.0' 'pluma<2.0.0')
replaces=('pluma-trailsave')
source=("trailsave.pluma-plugin" "trailsave.py")
sha256sums=('6f9d6cd161424caf3e3a8c9d6c05dab7d3d35c843f050f593e98011aa579a1db'
            'ef5aa19d052bce8f28e694410b9229b31b61bcf9fcd98ad9423d1d043b33eb88')

build() {
  :
}

package() {
  mkdir -p "$pkgdir/usr/lib/pluma/plugins"
  cd "$srcdir"
  cp -f trailsave.pluma-plugin "$pkgdir/usr/lib/pluma/plugins"
  cp -f trailsave.py "$pkgdir/usr/lib/pluma/plugins"
}
