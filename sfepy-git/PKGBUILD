# Maintainer: Renato Coutinho <renato.coutinho@gmail.com>
pkgname=sfepy-git
pkgver=20111031
pkgrel=1
pkgdesc="Simple Finite Elements in Python"
arch=('i686' 'x86_64')
url="http://sfepy.kme.zcu.cz"
license=('BSD')
conflicts=('sfepy')
provides=('sfepy')
source=()
md5sums=()

makedepends=('python2-distribute' 'git')
depends=('python2-numpy' 'python2-scipy' 'swig' 'python2-pyparsing' 
         'python2-matplotlib' 'python-pytables')

optdepends=('scikits-umfpack: used to solve most systems'
            'python2-sympy: used by some tests and functions'
            'python-pexpect: required by schroedinger.py'
            'gmsh: required by schroedinger.py (2D)'
            'tetgen: required by schroedinger.py (3D)'
            'python2-ipython: required for isfepy'
            'python-multiprocessing: required by log.py (live plotting)')

_gitroot='https://github.com/sfepy/sfepy.git'
_gitname='sfepy'

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."
  if [ -d $_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
      cd ..
  else
      git clone --depth=1 $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
  
  cp -r $_gitname $_gitname-build
  cd $_gitname-build

  python2 setup.py build_ext --inplace
  python2 setup.py install --prefix=/usr --root=${pkgdir} || return 1

  cd ${pkgdir}/usr/bin
  mkdir ${pkgdir}/usr/share/sfepy/bin
  mv eigen.py findSurf.py genPerMesh.py postproc.py runTests.py shaper.py test_install.py extractor.py friction_slip.py homogen.py plotPerfusionCoefs.py probe.py schroedinger.py simple.py ${pkgdir}/usr/share/sfepy/bin
}
