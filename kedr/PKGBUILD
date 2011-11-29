pkgname=kedr
pkgver=0.3
pkgrel=2
pkgdesc='Framework for dynamic (runtime and post factum) analysis of Linux kernel modules.'
arch=('i686' 'x86_64')
url="http://code.google.com/p/${pkgname}/"
license=('GPL2')

source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('a5d87aa6215b7d8aee0fe06e4184c5e92618b240')
depends=('bash' 'gcc-libs')
makedepends=('cmake>=2.6' 'linux-headers')

options=(!strip !libtool !buildflags !makeflags docs)

_builddir="${srcdir}/builddir"
_kernver=$(pacman -Q linux | cut -d . -f 2 | cut -f 1 -d -)

build() {
   depends+=("linux>=3.${_kernver}" "linux<3.`expr ${_kernver} + 1`")
   
   mkdir "${_builddir}"
   cd "${_builddir}"
   cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/ ../"${pkgname}-${pkgver}"/
   make
}

package() {
   cd "${_builddir}"
   make DESTDIR="${pkgdir}" install
   
   local -A _replace
   
   mkdir -p "${pkgdir}/lib/modules/extramodules-3.${_kernver}-ARCH/misc"
   install -Dm644 $(find "${pkgdir}" -type f -name '*.ko') "${pkgdir}/lib/modules/extramodules-3.${_kernver}-ARCH/misc/"
   rm -fr "${pkgdir}/usr/lib/modules/"
   _replace["usr/lib/modules/$(uname -r)"]="lib/modules/extramodules-3.${_kernver}-ARCH"
   
   mkdir -p "${pkgdir}/usr/share/${pkgname}/configs/"
   install -D "${pkgdir}"/var/opt/"${pkgname}"/configs/* "${pkgdir}/usr/share/${pkgname}/configs/"
   rm -fr "${pkgdir}/var/opt/"
   _replace["var/opt/${pkgname}"]="usr/share/${pkgname}"
   
   _replace['sbin/lsmod']='bin/lsmod'
   
   for _i in ${!_replace[@]}
   do
      sed -i -e "s#${_i}#${_replace[${_i}]}#g" $(grep -ilIRF "${_i}" "${pkgdir}")
   done
   
   find "${pkgdir}" -type d -name 'symvers' -delete
   find "${pkgdir}" -type d -empty -delete
}
