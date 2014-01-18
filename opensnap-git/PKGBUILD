# Maintainer:  Gabriel Pickl <gabriel@syntax-austria.org>

pkgname=opensnap-git
_gitname=opensnap
pkgver=279d689
pkgrel=1
pkgdesc="A window snapping utility for openbox"
arch=('i686' 'x86_64')
url="https://github.com/lawl/opensnap"
license=('copyright')
depends=('gtk3')
optdepends=('wmctrl')
makedepends=('git')
conflicts=('opensnap')
provides=('opensnap')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# 'pacman41' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=('git://github.com/lawl/opensnap.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  install -Dm755 "bin/opensnap" "$pkgdir/usr/bin/opensnap"
  install -dm755 sample_configs "$pkgdir/usr/share/opensnap/sample_configs"
  install -m755 sample_configs/* "$pkgdir/usr/share/opensnap/sample_configs"
}
