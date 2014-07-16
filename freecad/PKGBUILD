# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jordi De Groof <jordi (dot) degroof (at) gmail (dot) com>
# Contributor: mickele
# Contributor: manwithgrenade
# Contributor: bricem13
# Contributor: gborzi

pkgname=freecad
pkgver=0.14.3702
pkgrel=2
pkgdesc='A general purpose 3D CAD modeler'
arch=('i686' 'x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
depends=('boost-libs' 'curl' 'opencascade>=6.6.0' 'pivy-hg' 'xerces-c' 'libspnav' 'shared-mime-info' 'hicolor-icon-theme' 'python2-matplotlib' 'shiboken' 'python2-pyside')
makedepends=('boost' 'eigen' 'gcc-fortran' 'swig' 'xerces-c' 'desktop-file-utils' 'cmake' 'coin>=3.1.3-9')
optdepends=('python2-matplotlib' 'pycollada-git' 'python2-pyqt4') 
options=(!libtool !makeflags)
install=freecad.install
source=("http://downloads.sourceforge.net/sourceforge/free-cad/freecad-${pkgver}.tar.gz"
	"${pkgname}.desktop"
	"${pkgname}.xml")

sha512sums=('6333bc8256728084b492687c5c6a5b3356212cbcab4bf0beb95fcdb0f9ac7c49df8eee0275e83feadc7b2460cf2396e88b0b309cbc1e1c9d46375bcadb334c13'
	    '43c3e0f917f80cb83d9daafd2b3c993139d3ffe9e4761125b6eec0a8b761df486dc07e3de391e092975878d8b10f774e455e318fdebd1530d977dbc463f2084d'
	    'ac0dfe1b2c58335867e94d4ce86696763b6354dcdca68a653bf115b6ea562f0f8ff7d243d42d0c6fd6e758bd488d626e30cd917bb1b5c676c1f0cafdece005d6')

prepare() {
  sed -i -e "46i\\\tModDir = '/usr/share/freecad/Mod'" \
      -e "50i\\\tLibDir = '/usr/share/freecad'" "${srcdir}/freecad-${pkgver}/src/App/FreeCADInit.py"
}

build() {
  cd "${srcdir}/freecad-${pkgver}/"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" .. \
    	-DCMAKE_INSTALL_DOCDIR:PATH="doc/freecad" \
	-DCMAKE_INSTALL_DATADIR:PATH="share/freecad" \
	-DCMAKE_INSTALL_LIBDIR:PATH="share/freecad" \
  	-DOCC_INCLUDE_DIR:PATH=/opt/opencascade/inc/ \
	-DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2 \
	-DFREECAD_USE_EXTERNAL_PIVY:BOOL=ON
  make
}

package() {
  cd "${srcdir}/freecad-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  # Symlink to /usr/bin
  ln -sf "/usr/bin/FreeCAD" "${pkgdir}/usr/bin/freecad"
  ln -sf "/usr/FreeCADCmd" "${pkgdir}/usr/bin/freecadcmd"

  cp -ra "${pkgdir}/usr/Mod" "${pkgdir}/usr/share/freecad/"
  rm -r "${pkgdir}/usr/Mod"

  # Install pixmaps and desktop shortcut
  desktop-file-install \
    --dir="${pkgdir}/usr/share/applications" \
    "${srcdir}/${pkgname}.desktop"

  # Mime info
  install -D -m644 "${srcdir}/${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
}
