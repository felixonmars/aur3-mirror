# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=ensymble
pkgver=0.29
pkgrel=1
pkgdesc="Tools to make PyS60 applications for Symbian S60 phones."
arch=('i686' 'x86_64')
url="http://code.google.com/p/ensymble/"
license=('GPLv2')
depends=('python2' 'openssl')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('2b52842ad88946854ece316157121527')

build() {
  cd $srcdir/$pkgname-$pkgver
 python2 setup.py install --prefix=$pkgdir/usr || return 1
}