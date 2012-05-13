# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Blind <x15@gmx.net>

pkgname=vapor
pkgver=2.1.0
pkgrel=1
pkgdesc="A visualization and analysis platform for ocean, atmosphere, and solar researchers"
arch=('i686' 'x86_64')
url="http://www.vapor.ucar.edu/"
license=('BSD')
depends=('assimp' 'glew' 'libgeotiff' 'netcdf' 'python2-numpy' 'qt')
install="${pkgname}.install"
source=("http://trac.osgeo.org/proj/export/2199/trunk/proj/src/projects.h"
        "00-options.patch"
        "01-vapor.patch"
        "${pkgname}.desktop")
md5sums=('b52422befbc613f48dcbbe022a64b486'
         'd36e50347e467bdb5976dfa0db7a1780'
         'ab4b1ad39b7acf88d934b7a2b65d35eb'
         '9db36852a8c1d20295b52bab81b818f9')

_vaporpkg="${pkgname}-${pkgver}-src.tar.gz"
_vapormd5='5bb98e750bc517abb1e6ea45d017c2e4'

build() {
  cd "${srcdir}"

  # Check VAPOR archive
  if [[ ! -f "${_vaporpkg}" ]]; then
    msg "!! VAPOR download requires site registration."
    msg "!! You need to manually download the sources:"
    msg "!!   https://docs.vapor.ucar.edu/page/vapor-download#Source"
    msg "!!"
    msg "!! Please copy ${_vaporpkg} to ${srcdir}" && return 1
  else
    if [[ "$(md5sum ${_vaporpkg} | awk '{print $1}')" == "${_vapormd5}" ]]; then
      msg "!! Check: ${_vaporpkg} is the correct."
    else
      msg "!! Check: ${_vaporpkg} didn't match md5sum. Exiting!" && return 1
    fi
  fi

  # Extract VAPOR archive
  bsdtar -xf "${_vaporpkg}"
  cd ${pkgname}-${pkgver}

  # Apply patches
  patch -Np1 -i ../00-options.patch
  patch -Np1 -i ../01-vapor.patch

  # Copy projects.h required by VAPOR
  cp ../projects.h include

  make BUILD_PYTHON=1 LDFLAGS='-lpthread'
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make INSTALL_PREFIX_DIR="${pkgdir}/usr" install

  # Move data files to /usr/share/vapor
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mv "${pkgdir}/usr/share/"{doc,examples,images,palettes,python,shaders} \
    "${pkgdir}/usr/share/${pkgname}"

  # Fix paths in setup scripts
  sed -i "s_${pkgdir}/usr_/usr_" "${pkgdir}/usr/bin/vapor-setup"*

  # Install a desktop entry
  install -Dm644 apps/vaporgui/images/vapor-icon-32.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install a license file
  install -Dm644 LICENSE.htm "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.htm"
}
