# Maintainer: Frank Poehler <fp29129@googlemail.com>
pkgname=firefox-extension-firebug-stable
_short=firebug
_firefox_extension_id=firebug@software.joehewitt.com
_firefox_version=6.0.1
pkgver=1.8.1
_series=1.8
pkgrel=3
pkgdesc="A wealth of development tools in a Firefox add-on. Edit, debug, and monitor CSS, HTML, and JavaScript live in any web page. Stable version for latest official Firefox (currently version 6.0.1)."
arch=('any')
url="http://getfirebug.com/"
license=('BSD')
groups=()
depends=('firefox>=6.0.1')
makedepends=()
optdepends=()
provides=()
conflicts=('firefox-extension-firebug-svn' 'firefox-firebug')
replaces=()
backup=()
options=()
install=
changelog=
source=(http://getfirebug.com/releases/"$_short/$_series/$_short-$pkgver".xpi)
noextract=()
sha256sums=('3840ea70682c4c96646d6fd29bdde85e7a59a8e604ed6e10735feb242f6b1c94')

build() {
  cd "$srcdir"
}

package() {
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv license.txt "$pkgdir/usr/share/licenses/$pkgname/"
  rm "$_short-$pkgver.xpi"
  mkdir -p "$pkgdir/usr/lib/firefox-$_firefox_version/extensions/$_firefox_extension_id"
  mv * "$pkgdir/usr/lib/firefox-$_firefox_version/extensions/$_firefox_extension_id/"
}

# vim:set ts=2 sw=2 et:
