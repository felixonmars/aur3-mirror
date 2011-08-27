# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
pkgname=likepython
pkgver=0.1
pkgrel=1
pkgdesc="A Python that understands the way kids are speaking today"
arch=('i686' 'x86_64')
url="http://www.staringispolite.com/likepython/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("http://www.staringispolite.com/likepython/${pkgname}_${pkgver}.tgz")
md5sums=('82548013952251724b69e0f346ef41f3')

build() {
  true
}

package() {
  cd "$srcdir"
  install -D -m755 likepython $pkgdir/usr/bin/likepython
  install -D -m644 hello_world.lp $pkgdir/usr/share/likepython/hello_world.lp
}

# vim:set ts=2 sw=2 et:
