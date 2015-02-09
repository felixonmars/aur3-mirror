# Maintainer : Rob McCathie <korrode AT gmail>
# Contributor: Xemertix <arch88(at)katamail(dot)com>

pkgname=trpc-libs
pkgver=20120628
pkgrel=4
pkgdesc="TreeP runtime libraries"
arch=('i686' 'x86_64')
url="http://fsinapsi.altervista.org"
license=('GPL')
depends=('gmp' 'zlib' 'gc')
makedepends=('mathgl' 'libexif' 'libid3tag' 'libjpeg' 'curl' 'imlib2' 'sqlite3' 'gtk2' 'libmysqlclient' 'opencv')
source=("${url}/code/treep/trp-${pkgver}.zip")
sha1sums=('efddf46157e765a0134e474d2ee01a8fa6c6ca65')

prepare() {
  cd "${srcdir}/trp-${pkgver}"
  sed -i 's|_trp_gc_warn_proc = GC_set_warn_proc( trp_gc_warn_proc );|//_trp_gc_warn_proc = GC_set_warn_proc( trp_gc_warn_proc );|g' trp/trp.c
}

build() {
  cd "${srcdir}/trp-${pkgver}"
  make rts
}

package() {
  install -dm755 "${pkgdir}/usr/lib"
  cp "${srcdir}/trp-${pkgver}"/libs/* "${pkgdir}/usr/lib/"
}
