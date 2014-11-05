# See AUR interface to contact current maintainer.

pkgname=rcs-fast-export-git
_pkgname=${pkgname%-*}
pkgver=0.2.7.r74
pkgrel=1
pkgdesc="rcs-fast-export: Import RCS repositories into GIT"
arch=('any')
url="http://wok.oblomov.eu/tecnologia/rcs-fast-export/"
license=('custom')
depends=('ruby')
makedepends=('git')
source=("$pkgname::git://github.com/Oblomov/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "%s.r%s" \
    "$(git describe --abbrev=0 | sed 's/^v//')" \
    "$(git rev-list --count HEAD)"
}

package () {
  cd "$srcdir/$pkgname"

  #install -Dm755 {"$srcdir/$pkgname","$pkgdir/usr/bin"}/"$_pkgname".rb
  install -Dm755 {,"$pkgdir"/usr/bin/}"$_pkgname".rb
}
