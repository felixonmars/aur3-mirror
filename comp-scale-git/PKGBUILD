# Maintainer: Moritz Maxeiner <moritz@ucworks.org>

pkgname=comp-scale-git
_gitname=comp-scale
pkgver=154.990b907
_commit=990b907a6dbd5462828a451890e1e9af8cbddc81
pkgrel=1
pkgdesc="Enlightenment e18 module: Scale windows down to see them all. Side by side. Latest git version for use with e18 development cycle. comp-scale cannot be used with E19 at the moment because of a compositor rewrite in E19."
arch=('i686' 'x86_64')
url="http://git.enlightenment.org/enlightenment/modules/comp-scale.git/"
license=('MIT')
depends=('enlightenment>=0.18.0' 'enlightenment<0.18.99')
makedepends=('git')
provides=('comp-scale')
options=('!libtool')
source=()
conflicts=('e-modules-extra' 'comp-scale' 'comp-scale-svn')
source=("$_gitname::git://git.enlightenment.org/enlightenment/modules/comp-scale.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install

  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -D -m644 COPYING-PLAIN $pkgdir/usr/share/licenses/$pkgname/COPYING-PLAIN
}
