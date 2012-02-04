# Maintainer: Michele Mocciola <mickele>

pkgname=salome-visu
pkgver=5.1.4
pkgrel=1
pkgdesc="SALOME provides a generic platform for Pre and Post-Processing for numerical simulation. VISU Module."
url="http://www.salome-platform.org"
depends=('salome-kernel' 'salome-gui' 'salome-med' 'python' 'python-numpy' 'qt' 'boost' 'opencascade' 'qwt' 'omniorb' 'omniorbpy' 'omninotify' 'swig' 'hdf5' 'med' 'vtk>=5.6' 'graphviz' 'flex' 'bison' 'sed')
makedepends=('gcc' 'automake' 'autoconf' 'libtool' 'make' 'doxygen' 'docutils' 'coreutils')
arch=('i686' 'x86_64')
conflicts=()
provides=()
license=('LGPL')
source=("http://files.opencascade.com/Salome/Salome${pkgver}/src${pkgver}.tar.gz" "${pkgname}.profile")
options=('libtool')

_source=/src${pkgver}/VISU_SRC_${pkgver}
_installdir=/opt/salome/visu
_pythonver=2.6
_vtkver=5.6

build() {

  source /etc/profile.d/salome-kernel.sh || return 1
  source /etc/profile.d/salome-gui.sh || return 1
  source /etc/profile.d/salome-med.sh || return 1

  cd ${srcdir}${_source} || return 1

  ./build_configure || return 1
  if [ "$CARCH" = "x86_64" ]; then
    export CPPFLAGS="${CPPFLAGS} -DHAVE_F77INT64"
  fi
  ./configure --prefix=${_installdir} \
	      --with-python-site=${_installdir}/lib/python-${_pythonver}/site-packages/salome \
	      --with-python-site-exec=${_installdir}/lib/python-${_pythonver}/site-packages/salome \
	      --with-qt=/usr \
	      --with-vtk=/usr \
	      --with-vtk-version=-${_vtkver} \
       	      --with-qwt=/usr \
	      --with-qwt_inc=/usr/include/qwt \
	      --disable-debug \
	      --enable-production || return 1

  make || return 1
}

package() {
  cd ${srcdir}${_source} || return 1

  make DESTDIR="${pkgdir}" install || return 1

  install -D -m755 "${srcdir}/${pkgname}.profile" \
                   "${pkgdir}/etc/profile.d/${pkgname}.sh" || return 1
}


md5sums=('ec363b2ff2dbdb889c973e9e19b2970f'
         'fd6397519448b3441f6d9f9d3b77e37c')
