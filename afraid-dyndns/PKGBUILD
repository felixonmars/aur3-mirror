# Maintainer: Rick Dutour Geerling <info at rickdg dot nl>
pkgname=afraid-dyndns
pkgver=1.1
pkgrel=1
pkgdesc="FreeDNS.afraid.org dynamic DNS client written in perl"
arch=('any')
url="http://perl.arix.com/"
license=('GPL3')
groups=()
depends=('perl')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://perl.arix.com/ftp/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=(38ca9be1d2ab409fe472524df53c8806) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./install $pkgdir
}