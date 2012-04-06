# Maintainer: Kaspar Bumke <kaspar.bumke@gmail.com>
_pkgname=pyrtmidi
pkgname=python2-rtmidi-svn
pkgver=36
pkgrel=1
pkgdesc="A Python interface to RtMidi"
arch=('any')
url="http://trac.assembla.com/pkaudio/wiki/pyrtmidi"
license=('GPL')
depends=('python2' 'rtmidi')
makedpends=('svn')

_svntrunk="http://svn2.assembla.com/svn/pkaudio/pyrtmidi"
_svnmod="pyrtmidi"

build() {
	cd ${srcdir}

	if [[ -d ${_svnmod}/.svn ]]; then
     (cd ${_svnmod} && svn up -r $pkgver)
  else
     svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

	msg "SVN checkout done or server timeout"
  msg "Starting make..."

	cd ${_svnmod}
	python2 setup.py build
}

package() {
	cd "$srcdir/$_svnmod"

	python2 setup.py install --root="$pkgdir/" --optimize=1

}
