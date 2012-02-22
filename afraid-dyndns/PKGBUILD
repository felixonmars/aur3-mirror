# Maintainer: Rick Dutour Geerling <info at rickdg dot nl>
pkgname=afraid-dyndns
pkgver=20120222
pkgrel=1
pkgdesc="FreeDNS.afraid.org dynamic DNS client written in perl"
arch=('any')
url="http://perl.arix.com/"
license=('GPL3')
groups=()
depends=('perl' 'perl-libwww' 'perl-xml-simple')
makedepends=('git')
optdepends=('perl-mime-lite')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
_gitroot="https://github.com/gwash/afraid-dyndns.git"
_gitname="master"

build() {
  cd "$srcdir/"
  git clone $_gitroot
}

package() {
  cd "$srcdir/$pkgname"
  ./install $pkgdir
}
