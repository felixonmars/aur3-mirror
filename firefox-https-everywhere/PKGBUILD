# Maintainer: Jannis Pinter <jannis@pinterjann.is>
pkgname=firefox-https-everywhere
pkgver=5.0.1
pkgrel=1
pkgdesc="Firefox extension that enforces HTTPS with many major websites."
arch=('any')
url="https://www.eff.org/de/https-everywhere"
license=('GPL3')
groups=('firefox-addons')
depends=("firefox")
makedepends=("unzip")
source=(https://www.eff.org/files/https-everywhere-$pkgver.xpi)
noextract=("https-everywhere-$pkgver.xpi")
sha256sums=('6cd9b9d9a2a7d02a3d3285d15e824189e931f97feecde77be015d80f8cb8d927')

prepare() {
	# /usr/bin/bsdtar cannot extract an xpi (all extracted files are empty)
	unzip https-everywhere-$pkgver.xpi 
}

package() {
  _dest="$pkgdir/usr/lib/firefox/browser/extensions/https-everywhere@eff.org"
  find . -type d -exec install -d {} $_dest/{} \;
  find . -type f -exec install -Dm644 {} $_dest/{} \;
}
