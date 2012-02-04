# Packager:  Pawel "kTT" Salata <rockplayer.pl@gmail.com>

pkgname=psyco2-svn
pkgver=66497
pkgrel=1
pkgdesc="JIT compiler for Python"
url="http://psyco.sourceforge.net"
arch=('i686')
license=('MIT')
depends=('python' 'glibc')
makedepends=('subversion')
conflicts=('psyco')
provides=('psyco2')

source=()
md5sums=()

_svntrunk=http://codespeak.net/svn/psyco/v2/dist
_svnmod=psyco2

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  python setup.py build || return 1
  python setup.py install --root="$pkgdir" || return 1
  install -D COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  rm -rf ${srcdir}/$_svnmod-build
}
