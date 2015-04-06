# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>
pkgname=ttf-mono16-git
pkgver=r45.ea95c74
pkgrel=1
pkgdesc="Monospaced fonts made for programming"
arch=('any')
url="https://andreaslarsen.github.io/mono16/"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
conflicts=('ttf-mono16')
provides=('ttf-mono16')
install='ttf-mono16-git.install'
source=('git+https://github.com/andreaslarsen/mono16.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mono16"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/mono16"

  # Install the fonts.
  install -d "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"

  # Copy license.
  install -D -m644 License.txt "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}

