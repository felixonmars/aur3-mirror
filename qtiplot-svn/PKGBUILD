# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir.archlinux.org>

pkgname=qtiplot-svn
pkgver=2113
pkgrel=1
pkgdesc="Data analysis and scientific plotting - free clone of Origin, developement version"
arch=('i686' 'x86_64')
url="http://soft.proindependent.com/qtiplot.html"
provides=('qtiplot')
conflicts=('qtiplot')
depends=('muparser>=1.30' 'gsl' 'pyqt' 'sip' \
         'boost>=1.39.0' 'libgl' 'shared-mime-info')
# build against liborigin provided in the package ...
# build against qwtplot3d provided in the package ...
# build against qwt provided in the package ...
# as systemwide one doesn't provide all needed functions
makedepends=('pkgconfig')
license=('GPL2')
install=${pkgname}.install
source=(qtiplot.desktop
        qtiplot.png
        qtiplot.pro.archlinux
        qwtplot3d_gcc.patch
        qtiplot.xml)

_svntrunk=http://svn.berlios.de/svnroot/repos/qtiplot/trunk
_svnmod=qtiplot

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk ${_svnmod} --config-dir ./ -r $pkgver 
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  if [ -d "${_svnmod}-build" ]; then
    # Remove old build directory
    rm -rf ${srcdir}/$_svnmod-build
  fi
  # Create copy for build
  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  # Make qwt
  cd ./3rdparty/qwt
  qmake || return 1
  make || return 1

  # Make qtiplot
  cd ${srcdir}/${_svnmod}-build/qtiplot
  cp ${srcdir}/qtiplot.pro.archlinux .
  sed -i 's#d_python_config_folder + "#"/usr/share/qtiplot#' src/core/ApplicationWindow.cpp

  qmake qtiplot.pro.archlinux QMAKESPEC=linux-g++ || return 1
  make QTDIR=/usr/ QMAKESPEC=linux-g++ || return 1
  INSTALL_ROOT=${pkgdir} make install || return 1

  # make it nice:
  install -D -m644 ${srcdir}/${_svnmod}.png \
  	${pkgdir}/usr/share/pixmaps/${_svnmod}.png || return 1
  install -D -m644 ${srcdir}/${_svnmod}.desktop \
  	${pkgdir}/usr/share/applications/${_svnmod}.desktop || return 1
  install -D -m644 ${srcdir}/${_svnmod}.xml \
        ${pkgdir}/usr/share/mime/packages/${_svnmod}.xml || return 1
}
md5sums=('56bd53f4f1367c285086acb969f13348'
         'ad8affbd6f0d5cbdcde46c923ee2668a'
         'b0f586e74badeedca21b1875f96507cb'
         'ab02c436ec2c04b1838cb5517383b4eb'
         '35683f3b32e1edcca0bb02c471d284e9')

