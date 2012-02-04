# Contributor: Vasiliy Kosenko (vkos) <vkosvk at ya dot ru>

pkgname=k3d-mercurial
pkgver=2651
pkgrel=1
pkgdesc="Mercurial version of K-3D, 3D modeling program"
arch=('i686' 'x86_64')
url="http://www.k-3d.org/wiki/Main_Page"
license=('GPL')
depends=(gtk gtkmm)
makedepends=(boost cmake mercurial)
optdepends=()
provides=(k3d)
conflicts=(k3d)
replaces=(k3d)

build() {
  cd $srcdir
  hg clone http://k3d.hg.sf.net/hgweb/k3d/k3d || cd k3d && hg update && cd .. || return 1
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../k3d || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
