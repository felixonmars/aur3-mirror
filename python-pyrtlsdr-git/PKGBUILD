#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>
pkgbase=python-pyrtlsdr-git
pkgname=('python2-pyrtlsdr-git' 'python-pyrtlsdr-git')
pkgver=0.2.0.r3.g0bc0ad7
pkgrel=1
pkgdesc="A Python wrapper for librtlsdr (a driver for Realtek RTL2832U based SDR's)"
url="https://github.com/roger-/pyrtlsdr/"
makedepends=('git' 'python-setuptools' 'python2-setuptools')
arch=('any')
license=('GPLv3')
source=('pyrtlsdr::git+https://github.com/roger-/pyrtlsdr')
md5sums=('SKIP')

pkgver() {
  cd pyrtlsdr
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -a pyrtlsdr{,-py2}
}

build() {
  cd "${srcdir}/pyrtlsdr"
  python setup.py build

  cd "${srcdir}/pyrtlsdr-py2"
  python2 setup.py build
}

package_python-pyrtlsdr-git() {
  cd pyrtlsdr
  python setup.py install --skip-build -O1 --prefix=/usr --root="${pkgdir}"
}

package_python2-pyrtlsdr-git() {
  cd pyrtlsdr-py2
  python2 setup.py install --skip-build -O1 --prefix=/usr --root="${pkgdir}"
}
