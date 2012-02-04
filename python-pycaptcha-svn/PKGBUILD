# Maintainer: Daniel Graña <daniel@insophia.com>
pkgname=python-pycaptcha-svn
pkgver=10873
pkgrel=1
pkgdesc='A Python framework for CAPTCHA tests'
arch=('i686' 'x86_64')
url='http://pypi.python.org/pypi/PyCAPTCHA/'
license=('MIT')
makedepends=('subversion')
depends=('python' 'pil')
conflicts=('python-pycaptcha')
provides=('python-pycaptcha')
source=()
_svntrunk=http://svn.navi.cx/misc/trunk/pycaptcha/
_svnmod=pycaptcha
md5sums=()

build() {
  cd $startdir/src
  msg "Connecting to $_svntrunk SVN server...."
  if [[ -d $_svnmod/.svn ]]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  cd $_svnmod
  python setup.py install --root=$startdir/pkg || return 1
}
