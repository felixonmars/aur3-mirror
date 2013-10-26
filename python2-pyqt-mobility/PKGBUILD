# $Id: PKGBUILD 135252 2011-08-11 16:55:55Z miguel angel $
# Maintainer: Miguel Rasero <info@linos.es>

pkgname=('python2-pyqt-mobility')
pkgver=1.0.1
pkgrel=5
arch=('i686' 'x86_64')
url="http://riverbankcomputing.co.uk/software/pyqtmobility/intro"
license=('GPL')
makedepends=('qt4' 'python-sip' 'dbus-python' 'python2-sip' 'phonon'
             'python2-opengl' 'qt-assistant-compat' 'qtmobility')
source=("http://riverbankcomputing.co.uk/static/Downloads/PyQtMobility/PyQtMobility-gpl-${pkgver}.tar.gz")
md5sums=('fbec98d04f6256b76f81a067bcaf4bc1')

build() {
  cd "${srcdir}"

  ### Python2 version ###
  cd "${srcdir}/PyQtMobility-gpl-${pkgver}"
  python2 configure.py \
    -e QtContacts \
    -e QtLocation \
    -e QtMultimediaKit \
    -e QtPublishSubscribe \
    -e QtSensors \
    -e QtServiceFramework \
    -e QtSystemInfo \
    -e QtVersit \
    -v /usr/share/sip \
    -n /usr/include

  # Thanks Gerardo for the rpath fix
  find -name 'Makefile' | xargs sed -i 's|-Wl,-rpath,/usr/lib||g;s|-Wl,-rpath,.* ||g'

  make
}

package_python2-pyqt-mobility(){
  pkgdesc="PyQt: A set of Python2 bindings for the Qt Mobility toolkit"
  depends=('python2-sip' 'python2-pyqt' 'pyqt-mobility')

  cd "${srcdir}/PyQtMobility-gpl-${pkgver}"
  # INSTALL_ROOT is needed for the QtDesigner module, the other Makefiles use DESTDIR
  make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install
}
