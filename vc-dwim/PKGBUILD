# Maintainer: Jim Meyering <jim@meyering.net>
# Contributor: Eric P. Hutchins <hutchiep190@potsdam.edu>

pkgname=vc-dwim
pkgver=1.5
pkgrel=1
pkgdesc="version-control-agnostic ChangeLog diff and commit tool"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.gnu.org/software/vc-dwim/index.html"
depends=('perl' 'netkit-bsd-finger' 'patch' 'ctags')
makedepends=('texinfo')
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.xz
        vc-dwim-1.5-symlinked-changelog.patch)
md5sums=('3a914bf4f04b9da9e2d01cadbfa70ad2'
         '63063249cb97160f8bd48c6f35e28296')
build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -Np1 -i ../vc-dwim-1.5-symlinked-changelog.patch
  ./configure --prefix=/usr
  make
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

