# Maintainer: milarr <lrmts82@gmail.com>
# Contributor: Emmanuel Quemener <emmanuel.quemener@ens-lyon.fr>
pkgname=('hpl')
pkgver=2.1
pkgrel=1.2
pkgdesc="High Performance Computing Linpack Benchmark"
arch=('x86_64')
url="http://www.netlib.org/benchmark/hpl/"
license=('custom')
depends=('blas' 'gcc-fortran' 'openmpi')
optdepends=('atlas-lapack: better performances than blas')
backup=('etc/hpl.conf')
changelog=ChangeLog
source=(http://www.netlib.org/benchmark/$pkgname/$pkgname-$pkgver.tar.gz
        COPYRIGHT)
md5sums=('091aa58c3e62bdf598b403420d8387ef'
         'ef4b7a2f7c90aaef6674a9781e196bd3') #generate with 'makepkg -g'

_topdir="../.."

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p0 < "${_topdir}/HPL_pdinfo.c.patch"
  patch -p0 < "${_topdir}/Makefile.patch"
  patch -p0 < "${_topdir}/Make.top.patch"

  cp "${_topdir}/Make.archlinux" "."

  if make arch=archlinux
    then echo "Compilation done."
    else
      echo "Compilation failed, cleaning build directories."
      make clean_arch_all arch=archlinux
  fi
}

package() {
  install=pacman.install

  cd "${srcdir}/${pkgname}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m755 -d "${pkgdir}/etc"

  install -m755 "bin/archlinux/xhpl" \
    "${pkgdir}/usr/bin"

  install -m644 "COPYRIGHT" \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m644 {BUGS,HISTORY,TUNING} \
    "${pkgdir}/usr/share/doc/${pkgname}"

  install -m644 "${_topdir}/licenses" \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m644 "${_topdir}/quickstart" \
    "${pkgdir}/usr/share/doc/${pkgname}"

  install -m644 "${_topdir}/${pkgname}.conf" \
    "${pkgdir}/etc"

  install -m755 "${_topdir}/${pkgname}run" \
    "${pkgdir}/usr/bin"
}
