# Contributor: Martin Bukatovic <martin.bukatovic@gmail.com>

pkgname=python-pyalsaaudio-svn
pkgver=35
pkgrel=1
pkgdesc="Python ALSA wrapper"
arch=('i686' 'x86_64')
url="http://pyalsaaudio.sourceforge.net"
license=("custom")
depends=('python>=2.6' 'alsa-lib')

provides=('python-pyalsaaudio')
conflicts=('python-pyalsaaudio')

source=()
md5sums=()

_svntrunk=https://pyalsaaudio.svn.sourceforge.net/svnroot/pyalsaaudio/trunk
_svnmod=pyalsaaudio

build() {
  cd $srcdir

  # Get Latest Source Code
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  # Install
  cd $_svnmod
  python setup.py install --root=$pkgdir
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
