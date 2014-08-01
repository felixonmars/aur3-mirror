# Maintainer: lks <lukas dot graetz at web dot de>
_pkgname=cbootimage
pkgname=${_pkgname}-git
pkgver=1.4
pkgrel=2
pkgdesc="Tools to dump and generate boot config table on Tegra devices"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url="http://nv-tegra.nvidia.com/gitweb/?p=tools/cbootimage.git;a=summary"
makedepends=('git' 'automake' 'autoconf')
provides=("cbootimage=${pkgver}")
conflicts=('cbootimage')
source=('git://github.com/NVIDIA/cbootimage.git')
md5sums=('SKIP')

#_gitroot="git://nv-tegra.nvidia.com/tools/cbootimage.git"

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe | sed 's|-|.|g;s|v||'
}

build() {
  cd "$srcdir/$_pkgname"
  autoreconf --install --symlink
  ./configure --prefix=/usr
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
