# Maintainer: xenatt <exenatt {at} gmail {dot} com>
# Contributor: xenatt <exenatt {at} gmail {dot} com>

pkgname=lomaputta-ttf
pkgver=20140618
pkgrel=1
pkgdesc="best Truetype font for Thais user"
arch=('any')
url="https://github.com/xenatt/Linux/"
license=('GPL3')
depends=()
source=($pkgname-$pkgver.zip::https://dl.dropboxusercontent.com/u/2805965/Lomaputta-ttf.zip)
sha1sums=('30efa4a3df4e9d4a65accbb5ce57fa3ddc62496c')
conflicts=()
install='lomaputta-ttf.install'
package() {
  cd "$srcdir/Lomaputta-ttf";
  find . -type f -name \*.ttf -exec install -Dm644 '{}' "$pkgdir/usr/share/fonts/TTF/{}" \;
}

