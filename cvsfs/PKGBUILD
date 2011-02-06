# $Id: PKGBUILD,v 1.5 2003/11/06 08:27:12 dorphell Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=cvsfs
pkgver=1.1.9
pkgrel=1
pkgdesc="cvsfs is an attempt to let a user mount a CVS project like any file system"
arch=('i686')
depends=('cvs')
license=('GPL')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('622365b1b94e85653cec013fa43504d3')
url="http://sourceforge.net/projects/cvsfs/"

build() {
cd $startdir/src/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1
make prefix=$startdir/pkg/usr install
}
