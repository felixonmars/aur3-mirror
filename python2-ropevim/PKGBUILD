# Maintainer: Allen Li <darkfeline at abagofapples.com>
# Submitter: Moikz
pkgname=python2-ropevim
pkgver=0.4
pkgrel=3
pkgdesc="Plugin for performing python refactorings in vim"
arch=('any')
url="http://rope.sourceforge.net/ropevim.html"
license=('GPL')
depends=('python2-ropemode')
provides=('ropevim')
conflicts=('ropevim')
source=(http://pypi.python.org/packages/source/r/ropevim/ropevim-$pkgver.tar.gz)
md5sums=('084346677e7a8dd896f9278674d4f60f')

build() {
  cd $srcdir/ropevim-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr --optimize=1
  install -m 444 -D ropevim.vim $pkgdir/usr/share/vim/vimfiles/ftplugin/python/ropevim.vim
}
