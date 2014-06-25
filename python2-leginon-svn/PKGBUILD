# Maintainer:  xhark <inter1965@gmail.com>

pkgname=("python2-leginon-core-svn" "python2-leginon-pyscope-svn" "python2-leginon-redux-svn" "python2-leginon-sinedon-svn" "python2-leginon-pyami-svn" "python2-leginon-imageviewer-svn" "python2-leginon-radermacher-svn" "python2-leginon-libcv-svn" "python2-leginon-numextension-svn" "python2-leginon-appion-svn")
pkgbase=python2-leginon-svn
pkgver=r18322
pkgrel=1
pkgdesc="A system designed for automated collection of images from a transmission electron microscope. Instruments supported: FEI Tecnai series TEM, Tietz and Gatan CCD cameras."
url="http://ami.scripps.edu/redmine/projects/ami/wiki/software"
arch=("i686" "x86_64" "armv7h")
groups=("python2-leginon")
provides=("python2-leginon")
conflicts=("python-leginon")
makedepends=("subversion")
license=("APACHE")
source=("myami::svn+http://ami.scripps.edu/svn/myami/trunk"
  "redux.service"
  "redux.install"
  "python2-leginon-pyami-svn.patch")

md5sums=('SKIP'
	 'a7f857ab226d1301bdcc199f99df411c'
	 '11e1c39ab3051166fa0c686104e483ae'
	 '048c866717fee8aa9bb63c924ae91853')

_py2ver=$(python2 -c "import sys;a=sys.version_info;sys.stdout.write(\"%d.%d\"%(a.major,a.minor))")

pkgver() {
  cd "$srcdir/myami"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd ${srcdir}/myami
  grep -rl "#\!/usr/bin/env python" . | xargs sed -i -e "s/env\ python/python2/g"
  grep -rl "^import Image$" . | xargs sed -i -e "s/^import\ Image$/from\ PIL\ import\ Image/g"
  #grep -rl "^import ImageDraw$" . | xargs sed -i -e "s/^import\ ImageDraw$/from\ PIL\ import\ ImageDraw/g"
  #patch -p0 -i ${srcdir}/python2-leginon-core-svn.patch
  patch -p0 -i ${srcdir}/python2-leginon-pyami-svn.patch
  #fix all png
  find leginon/icons -type f -iname "*.png" | xargs -n 1 -P 3 optipng -quiet -force -fix
}

build() {
  cd ${srcdir}/myami
}

package_one() {
  cd ${srcdir}/myami/"$1"
  python2.7 setup.py install --root="$pkgdir" || return 1
}

package_python2-leginon-core-svn() {
  makedepends=("subversion" "optipng")
  provides=("python2-leginon-core")
  depends=("python2" "python2-fs" "python2-leginon-pyami" "python2-leginon-redux" "wxpython" "python2-scipy" "python2-pillow" "apache" "mysql" "mysql-python" "php")
  backup=("etc/myami/leginon.cfg")
  package_one "leginon"
  install -d ${pkgdir}/etc/myami
  install -m 0444 ${srcdir}/myami/leginon/leginon.cfg.template ${pkgdir}/etc/myami/leginon.cfg
  chmod +x ${pkgdir}/usr/lib/python"${_py2ver}"/site-packages/leginon/start-leginon.py
  chmod +x ${pkgdir}/usr/lib/python"${_py2ver}"/site-packages/leginon/launcher.py
  ln -sf /usr/lib/python"${_py2ver}"/site-packages/leginon/start-leginon.py ${pkgdir}/usr/bin
  ln -sf /usr/lib/python"${_py2ver}"/site-packages/leginon/launcher.py ${pkgdir}/usr/bin
}

package_python2-leginon-pyscope-svn() {
  pkgdesc="A Python extension for controlling Transmission Electron Microscopes and CCD cameras"
  provides=("python2-leginon-pyscope")
  backup=("etc/myami/instruments.cfg")
  package_one "pyscope"
  install -d ${pkgdir}/etc/myami
  install -m 0444 ${srcdir}/myami/pyscope/instruments.cfg.template ${pkgdir}/etc/myami/instruments.cfg
}

package_python2-leginon-redux-svn() {
  pkgdesc="image file server of myamiweb"
  provides=("python2-leginon-redux")
  backup=("etc/myami/redux.cfg")
  install="redux.install"
  package_one "redux"
  rm -rf ${pkgdir}/etc/init.d
  install -d ${pkgdir}/usr/lib/systemd/system
  install -d ${pkgdir}/etc/myami
  install -d ${pkgdir}/etc/fftw
  install -m 0440 ${srcdir}/redux.service ${pkgdir}/usr/lib/systemd/system
  install -m 0444 ${srcdir}/myami/redux/redux.cfg.template ${pkgdir}/etc/myami/redux.cfg
}

package_python2-leginon-sinedon-svn() {
  provides=("python2-leginon-sinedon")
  depends=("python2-leginon-core")
  package_one "sinedon"
}

package_python2-leginon-pyami-svn() {
  provides=("python2-leginon-pyami")
  pkgdesc="python interface for EM"
  depends=("python2" "glibc" "python2-fftw3")
  package_one "pyami"
  install -d ${pkgdir}/etc/myami
}

package_python2-leginon-imageviewer-svn() {
  provides=("python2-leginon-imageviewer")
  pkgdesc="python interface for leginon's imageviewer."
  depends=("python2-leginon-core")
  package_one "imageviewer"
}

package_python2-leginon-radermacher-svn() {
  provides=("python2-leginon-radermacher")
  pkgdesc="python interface for radermacher"
  depends=("python2-leginon-core")
  package_one "modules/radermacher"
}

package_python2-leginon-libcv-svn() {
  provides=("python2-leginon-libcv")
  pkgdesc="python interface for libcv"
  depends=("python2-leginon-core")
  package_one "modules/libcv"
}

package_python2-leginon-numextension-svn() {
  provides=("python2-leginon-numextension")
  pkgdesc="A Python numeric extension for controlling Transmission Electron Microscopes and CCD cameras"
  depends=("python2-leginon-core")
  package_one "modules/numextension"
}

package_python2-leginon-appion-svn() {
  pkgdesc="appion is a pipeline for single particle analysis."
  cd ${srcdir}/myami/appion
  python2.7 setup.py install --install-scripts=/usr/bin --root="$pkgdir" || return 1
}
