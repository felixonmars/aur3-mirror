# Maintainer: Allen Li <darkfeline at abagofapples.com>
# Submitter: Moikz
pkgname=python-ropevim
pkgver=0.4
pkgrel=4
pkgdesc="Plugin for performing python refactorings in vim"
arch=('any')
url="http://rope.sourceforge.net/ropevim.html"
license=('GPL')
depends=('python-ropemode')
provides=('ropevim')
conflicts=('ropevim')
source=(http://pypi.python.org/packages/source/r/ropevim/ropevim-$pkgver.tar.gz
    ropevim.patch)
md5sums=('084346677e7a8dd896f9278674d4f60f'
         'bd2591149f074048457607a983391852')

build() {
  cd $srcdir/ropevim-$pkgver
  patch -p1 < $srcdir/ropevim.patch
  2to3 -wn ropevim.py
  python setup.py install --root=$pkgdir --prefix=/usr --optimize=1
  install -m 444 -D ropevim.vim $pkgdir/usr/share/vim/vimfiles/ftplugin/python/ropevim.vim
}
