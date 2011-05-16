# Maintainer: Michel Rode <rode@b1-systems.de>
pkgname=cloog-parma
pkgver=0.16.1
pkgrel=3
pkgdesc="Generating loops for scanning polyhedra (alternative PPL-based version)"
url="http://www.cloog.org"
arch=('i686' 'x86_64')
license=('GPL')
provides=('cloog-ppl')
depends=()
optdepends=()
makedepends=()
conflicts=('cloog-ppl')
replaces=()
backup=()

source=(http://www.bastoul.net/cloog/pages/download/$pkgname-$pkgver.tar.gz)
md5sums=(f483539b30a60a3478eea70c77b26bef)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-bits=gmp  --with-ppl=/usr --program-suffix=-ppl
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	#make DESTDIR="${pkgdir}" install
  
  mkdir -p ${pkgdir}/usr/bin
  install -m 0755 cloog ${pkgdir}/usr/bin/cloog-ppl

  mkdir -p ${pkgdir}/usr/include/cloog/ppl
  install -m 0644 include/cloog/ppl/*.h ${pkgdir}/usr/include/cloog/ppl

  mkdir -p ${pkgdir}/usr/lib/pkgconfig
  install -m 0755 libcloog-ppl.la ${pkgdir}/usr/lib/
  install -m 0644 .libs/libcloog-ppl.a ${pkgdir}/usr/lib/
  install -m 0755 .libs/libcloog-ppl.so.1.0.1 ${pkgdir}/usr/lib/
  ln -s libcloog-ppl.so.1.0.1 ${pkgdir}/usr/lib/libcloog-ppl.so
  ln -s libcloog-ppl.so.1.0.1 ${pkgdir}/usr/lib/libcloog-ppl.so.1

  mkdir -p ${pkgdir}/usr/lib/pkgconfig
  install -m 0644 cloog-ppl.pc ${pkgdir}/usr/lib/pkgconfig/cloog-ppl.pc
}

# vim: set ts=2 softtabstop=2 expandtab filetype=sh :
