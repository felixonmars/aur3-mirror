# Maintainer: Stefan Agner <stefan at agner dot ch>
_pkgname=tegrarcm
pkgname=${_pkgname}-git
pkgver=v1.6
pkgrel=1
pkgdesc="Tegra ReCovery Mode tool; communicates with Tegra's boot ROM over USB"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url="http://http.download.nvidia.com/tegra-public-appnotes/flashing-tools.html"
makedepends=('git' 'automake' 'autoconf' 'crypto++')
provides=('tegrarcm=1.6')
conflicts=('tegrarcm')
source=('git://github.com/NVIDIA/tegrarcm.git')
md5sums=('SKIP')

#_gitroot="git://nv-tegra.nvidia.com/tools/cbootimage.git"

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe
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
