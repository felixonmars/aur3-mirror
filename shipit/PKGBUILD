# Maintainer: Roman Tataurov <roman@webhive.ru>

pkgname=shipit
pkgver=0.0.2
pkgrel=1
epoch=
pkgdesc="Minimalistic SSH deployment"
arch=('any')
url="https://github.com/sapegin/shipit"
license=('MIT')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=('shipit')
conflicts=('shipit')
replaces=()
backup=()
options=()
install=
changelog=
source=('https://raw.github.com/sapegin/shipit/master/bin/shipit')
noextract=()
md5sums=('dca896594ae29c34e18c5fb4f0b04aa8') #generate with 'makepkg -g'

package() {
  install -Dm775 $pkgname "$pkgdir"/usr/bin/$pkgname
}
