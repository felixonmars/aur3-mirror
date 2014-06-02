# Maintainer: Pr0Wolf29 <Pr0Wolf29 .a.t. outlook .d.o.t. com>
pkgname=opensnap-quicktile-git
_gitname=opensnap-quicktile
pkgver=1.2
pkgrel=4
pkgdesc="A window snapping utility for openbox using quicktile."
arch=('i686' 'x86_64')
url="https://github.com/Pr0Wolf29/opensnap-quicktile"
license=('BSD')
depends=('gtk3' 'quicktile-git')
makedepends=('git')
provides=('opensnap-quicktile')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# 'pacman41' is then checked out upon cloning, expediating versioning:
source=('git://github.com/Pr0Wolf29/opensnap-quicktile.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

build() {
  cd $_gitname
  make
}

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $_gitname
  install -Dm755 "bin/opensnap-quicktile" "$pkgdir/usr/bin/opensnap-quicktile"
  }