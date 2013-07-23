pkgname=mingw-w64-qxorm
_pkgname=QxOrm
pkgver=1.2.4
pkgrel=2
pkgdesc="QxOrm C++ library, provides Object Relational Mapping (ORM) feature in C++. (mingw-w64)"
arch=('any')
url="http://www.qxorm.com/"
license=('LGPL')
depends=('mingw-w64-crt' 'mingw-w64-boost' 'mingw-w64-qt4')
makedepends=('mingw-w64-gcc')
source=(http://www.qxorm.com/version/${_pkgname}_${pkgver}.zip 'qt_handle_long_win32.patch')
sha1sums=('2a7e0c6e9e7c69468e46682a3df14dc039b1c6f9'
          '76d933677bd5fdb84658df4e1de3545d61365add')

options=('!strip' '!buildflags')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS

  cd "${srcdir}/${_pkgname}"
  patch -p0 < "${startdir}/qt_handle_long.patch"

  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/mingw-w64-qxorm-build-${_arch}
    cd ${srcdir}/mingw-w64-qxorm-build-${_arch}  

    sed -i 's/boost_serialization-vc90-mt-gd-1_42/boost_serialization-mt/g' "${startdir}/src/${_pkgname}/QxOrm.pri"
    sed -i 's/boost_serialization-vc90-mt-1_42/boost_serialization-mt/g' "${startdir}/src/${_pkgname}/QxOrm.pri"
  
    export INSTALLROOT=${pkgdir}

    [ "${_arch}" = "i686-w64-mingw32" ] && SPEC="win32-g++-cross" || SPEC="win32-g++-cross-x64"
    /usr/${_arch}/bin/qmake -spec ${SPEC} "${startdir}/src/${_pkgname}/QxOrm.pro"
    make release
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/mingw-w64-qxorm-build-${_arch}  
    make INSTALLROOT=${pkgdir} release-install
    mkdir -p "${pkgdir}/usr/${_arch}/lib"
    install -m 0755 "${srcdir}/mingw-w64-qxorm-build-${_arch}/release/${_pkgname}.dll" "${pkgdir}/usr/${_arch}/lib"
    install -m 0755 "${srcdir}/mingw-w64-qxorm-build-${_arch}/release/lib${_pkgname}.a" "${pkgdir}/usr/${_arch}/lib"
    cp -r "${srcdir}/${_pkgname}/include" "${pkgdir}/usr/${_arch}/"
    cp -r "${srcdir}/${_pkgname}/inl" "${pkgdir}/usr/${_arch}/"
  done
}

