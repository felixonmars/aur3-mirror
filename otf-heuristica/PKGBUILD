# Maintainer: imotec <info(at)imotec(dot)nl>

pkgname=otf-heuristica
pkgver=1.0.2
pkgrel=1
pkgdesc="A font, based on the 'Adobe Utopia' font that was released to the TeX Users Group under a liberal license."
arch=('any')
url="http://code.google.com/p/evristika/"
license=('custom:OFL')
depends=()
install=heuristica.install
source=(
        "http://downloads.sourceforge.net/project/heuristica/heuristica-ttf-1.0.2.tar.xz"
        )
sha256sums=('08bf21e44941d195dceab637c3d8e22f4b5ce8490c83993cebd85d721b92553d')

build() {
  /bin/true
}

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
