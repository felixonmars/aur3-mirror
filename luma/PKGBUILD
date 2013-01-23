# $Id: PKGBUILD 17584 2010-05-24 15:29:45Z spupykin $
# Contributor: Apollon Oikonomopoulos <apoikos@yahoo.gr>
pkgname=luma
pkgver=3.0.7
pkgrel=1
pkgdesc="A feature-full LDAP browser/editor using PyQT"
arch=(any)
url="http://luma.sourceforge.net/"
license=("GPL")
depends=('pyqt>=4.8' 'python2-ldap>=2.3')
makedepends=('pyqt>=4.8' 'python2-ldap>=2.3')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b84a378d171cdf070b25aa7794b33214')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir $pkgdir/usr
  python2 setup.py install --prefix=$pkgdir/usr
  sed -i "s|/usr/bin/env python|/usr/bin/env python2|" $pkgdir/usr/lib/python2.7/site-packages/luma/luma.py
}
