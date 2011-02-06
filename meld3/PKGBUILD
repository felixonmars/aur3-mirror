# Contributor: Daniele Paolella <dp@mcrservice.it>
pkgname=meld3
pkgver=0.6.7
pkgrel=1
pkgdesc="An HTML/XML templating engine"
arch=('i686' 'x86_64')
url="http://www.plope.com/software/meld3/"
license=('ZPL')
depends=('python2')
changelog=ChangeLog
source=("http://pypi.python.org/packages/source/m/meld3/meld3-$pkgver.tar.gz")
md5sums=('53e589482029ee84ffac9362db71eabe')

build() {
  cd "$srcdir/meld3-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

# vim:set ts=2 sw=2 et:
