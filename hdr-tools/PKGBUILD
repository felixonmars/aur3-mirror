# Maintainer: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=hdr-tools
pkgver=2012.12.11
pkgrel=3
pkgdesc="A set of command-line tools for creating and manipulating High Dynamic Range (HDR) images"
arch=('i686' 'x86_64')
url="http://ttic.uchicago.edu/~cotter/projects/hdr_tools/"
license=('GPLv3')
depends=('openexr' 'imagemagick' 'libtiff' 'popt' 'ilmbase')
source=(
'http://ttic.uchicago.edu/~cotter/projects/hdr_tools/archives/hdr_src.tgz'
'fix-makefile.diff'
)
sha1sums=(
  '38b8db853fe24ab2824263a0064d0f1f92020d3d'
  'd26fa51d39252de78109ada792ccce8e2292007a'
)

build() {
  cd $srcdir
  patch -p0 < fix-makefile.diff
  make
}

package() {
  cd $srcdir
  make DESTDIR=$pkgdir install
}
