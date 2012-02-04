# Maintainer: Michele Mocciola <mickele>

pkgname=salome-multipr
pkgver=5.1.4
pkgrel=1
pkgdesc="SALOME provides a generic platform for Pre and Post-Processing for numerical simulation. MULTIPR Module."
url="http://www.salome-platform.org"
depends=('salome-med' 'python' 'qt' 'boost' 'opencascade' 'omniorb' 'omniorbpy' 'omninotify' 'swig' 'hdf5' 'med' 'sed')
makedepends=('gcc' 'automake' 'autoconf' 'libtool' 'make' 'doxygen' 'docutils' 'coreutils')
arch=('i686' 'x86_64')
conflicts=()
provides=()
license=('LGPL')
source=("http://files.opencascade.com/Salome/Salome${pkgver}/src${pkgver}.tar.gz"  "${pkgname}.profile")

_source=src${pkgver}/MULTIPR_SRC_${pkgver}
_installdir=/opt/salome
_pythonver=2.6

build() {
  source /etc/profile.d/salome-kernel.sh || return 1
  source /etc/profile.d/salome-gui.sh || return 1
  source /etc/profile.d/salome-med.sh || return 1

  cd ${srcdir}/${_source} || return 1

  # Builds and install
  ./build_configure || return 1
  ./configure --prefix=${_installdir} \
	      --with-python-site=${_installdir}/lib/python-${_pythonver}/site-packages/salome \
	      --with-python-site-exec=${_installdir}/lib/python-${_pythonver}/site-packages/salome \
	      --with-qt=/usr \
	      --disable-debug \
	      --enable-production || return 1

  make || return 1
}

package() {
  cd ${srcdir}/${_source} || return 1

  make DESTDIR="${pkgdir}" install || return 1

  install -D -m755 "${srcdir}/${pkgname}.profile" \
                   "${pkgdir}/etc/profile.d/${pkgname}.sh" || return 1
}

md5sums=('ec363b2ff2dbdb889c973e9e19b2970f'
         '0a48957c22ad216ac1a08ab5edc9a576')
