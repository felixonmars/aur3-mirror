# Maintainer: halim <sagikliwon@gmail.com>

pkgname=tortoisehg-hgtk
pkgver=2.0.5
pkgrel=1
pkgdesc="Mercurial GUI front end using hgtk official release"
arch=(i686 x86_64)
url="http://tortoisehg.sourceforge.net"
license=('GPL')
depends=('mercurial>=1.8.4' 'python2-qt' 'python2-qscintilla')
makedepends=('python2-distribute' 'gettext')
optdepends=('python2-iniparse: ini file support' 'python-nautilus: Python binding for Nautilus components')
conflicts=('tortoisehg' 'tortoisehg-hg')
source=(http://bitbucket.org/tortoisehg/targz/downloads/tortoisehg-${pkgver}.tar.gz)
md5sums=('89f745f481dc12346f229f6a9b8c4f70')
build() {
  cd ${srcdir}/tortoisehg-${pkgver}
  python2 setup.py build || return 1
  python2 setup.py install --root=$startdir/pkg || return 1
}

