# Maintainer: milarr <lrmts82@gmail.com>
# Contributor: Emmanuel Quemener <emmanuel.quemener@ens-lyon.fr>
pkgname=('hpl2')
pkgver=2.1
pkgrel=1.0
pkgdesc="High Performance Computing Linpack Benchmark"
arch=('x86_64')
url="http://www.netlib.org/benchmark/hpl/"
license=('custom')
depends=('blas' 'gcc-fortran' 'openmpi')
optdepends=('atlas-lapack: better performances than blas')
backup=('etc/hpl.conf')
#options=()
changelog=ChangeLog
source=(http://www.netlib.org/benchmark/hpl/hpl-$pkgver.tar.gz
        COPYRIGHT)
md5sums=('091aa58c3e62bdf598b403420d8387ef'
         'ef4b7a2f7c90aaef6674a9781e196bd3') #generate with 'makepkg -g'

build() {
# hpl name allready in use by a lazy maintainer and dead package...
# moving directory to still use pkgname variable
  mv "${srcdir}/hpl-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname}-${pkgver}"

  cp "../../HPL_pdinfo.c.patch" "."
  patch -p0 < "HPL_pdinfo.c.patch"

  cp "../../Makefile.patch" "."
  patch -p0 < "Makefile.patch"

  cp "../../Make.top.patch" "."
  patch -p0 < "Make.top.patch"

  cp "../../Make.archlinux" "."

  if make arch=archlinux
    then echo "Compilation ok"
    else make clean_arch_all arch=archlinux
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m755 -d "${pkgdir}/etc"

  install -m755 "bin/archlinux/xhpl" \
    "${pkgdir}/usr/bin/xhpl"

  install -m644 "COPYRIGHT" \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m644 {BUGS,HISTORY,TUNING} \
    "${pkgdir}/usr/share/doc/${pkgname}"

  install -m644 "../../QUICKSTART" \
    "${pkgdir}/usr/share/doc/${pkgname}"

  install -m644 "../../hpl.conf" \
    "${pkgdir}/etc"
}
