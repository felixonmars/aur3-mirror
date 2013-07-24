# Contributor: Alister.Hood <gmail>

pkgname=searchmonkey-gtk
pkgver=0.8.3
pkgrel=1
pkgdesc="A powerful GUI search utility for matching regex patterns.  Old gtk version."
arch=('i686' 'x86_64')
url="http://searchmonkey.sourceforge.net/"
license=('LGPL')
depends=('gtk2')
makedepends=('subversion')
source=("$pkgname::svn://svn.code.sf.net/p/searchmonkey/code/branches/adam/$pkgname_v$pkgver"
        "$pkgname.desktop")
md5sums=('SKIP'
         '2c6e065e49adc319ea3c947e5c756c19')

build() {
  cd $srcdir/$pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
  # Rename so we don't conflict with the new qt searchmonkey
  # I guess we will need to rename some more things to prevent file conflicts 
  # if the QT searchmonkey package ever starts using `make install`
  mv $pkgdir/usr/bin/searchmonkey $pkgdir/usr/bin/$pkgname
  # It's easier to install our own .desktop file than to patch the own upstream provided
  install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

# vim:set ts=2 sw=2 et:
