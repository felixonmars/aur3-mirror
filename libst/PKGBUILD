# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>

pkgname=libst
pkgver=1.9
pkgrel=2
pkgdesc="State-Threads fibers library"
arch=('i686' 'x86_64')
url="http://state-threads.sourceforge.net/index.html"
license=('GPL')
source=(http://sourceforge.net/projects/state-threads/files/state-threads/${pkgver}/st-${pkgver}.tar.gz)
md5sums=('79337c43268f6445cadec7b59a004cca')

build() {
  cd "${srcdir}/st-${pkgver}"

  make -j1 linux-optimized
}

package() {
  cd "${srcdir}/st-${pkgver}"

  mkdir -p "${pkgdir}"/usr/{include,lib}

  mv obj/st.h    "${pkgdir}/usr/include/"
  mv obj/libst.* "${pkgdir}/usr/lib/"
}
