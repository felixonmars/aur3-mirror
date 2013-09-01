_pkgname=dashpipe
pkgname=$_pkgname-git
pkgver=20130901
pkgrel=4
pkgdesc="A utility for ponifying and deponifying text"
arch=('any')
url="http://github.com/DanielOaks/$_pkgname/"
license=('MIT')
groups=()
depends=('perl')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/DanielOaks/$_pkgname.git")
md5sums=('SKIP')

#pkgver() {
#  cd "$srcdir/$_pkgname"
#  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
#}

prepare() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et: