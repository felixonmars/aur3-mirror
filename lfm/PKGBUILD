# Maintainer:  Inigo Serna <inigoserna :: gmail.com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: shamrok <szamrok :: gmail.com>

pkgname=lfm
pkgver=2.3
pkgrel=1
pkgdesc="A powerful file manager for the UNIX console. Based on curses and written in Python"
arch=('any')
url="http://code.google.com/p/lfm/"
license=('GPL3')
depends=('ncurses>=5.0' 'python2>=2.6')
source=(http://lfm.googlecode.com/files/$pkgname-$pkgver.tar.gz)


md5sums=('a3399306bbd63dd75851e6993fde92fb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '1s,env python,&2,' lfm/*
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
