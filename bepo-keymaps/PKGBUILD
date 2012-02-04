# Contributor: Maxime Wack <maximewack(a)free(dot)fr>
pkgname=bepo-keymaps
pkgver=1.0rc2
pkgrel=2
pkgdesc="bepo keymaps for the console (latin9 and unicode)"
arch=(any)
url="http://bepo.fr/wiki/Accueil"
license=('CCPL:cc-by-sa')
groups=()
depends=()
makedepends=(gzip)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://download.tuxfamily.org/dvorak/keymaps/fr-dvorak-$pkgname-$pkgver.tgz)
noextract=()
md5sums=('6eae20af50e69b77eb1be7a717ee9e37')

build() {
  cd "$srcdir/fr-dvorak-$pkgname-$pkgver"
  
  gzip fr-dvorak-bepo-utf8.map
  gzip fr-dvorak-bepo.map
}

package() {
  cd "$srcdir/fr-dvorak-$pkgname-$pkgver"
  
  install -Dm 644 fr-dvorak-bepo-utf8.map.gz $pkgdir/usr/share/kbd/keymaps/i386/dvorak/fr-dvorak-bepo-utf8.map.gz
  install -Dm 644 fr-dvorak-bepo.map.gz $pkgdir/usr/share/kbd/keymaps/i386/dvorak/fr-dvorak-bepo.map.gz
}
