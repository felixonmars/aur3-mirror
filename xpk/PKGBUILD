# Contributor: Dariusz 'quasi' Panchyrz <quasi@aur.archlinux.org>

pkgname=xpk
pkgver=0.1.4
pkgrel=1
pkgdesc="eXternal PacKer (XPK) library system for easier handling of crunching and decrunching"
arch=('i686' 'x86_64')
url="http://vesuri.jormas.com/xpk/"
license=('GPL')
install=$pkgname.install
source=(http://vesuri.jormas.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('02b3992f43854a7e50a93005f9fbb84d')

build() {
    __arch=ia64
    [ "$CARCH" == "i686"  ] && __arch=i386

  cd $startdir/src/$pkgname-$pkgver/
  ./configure --prefix=$startdir/pkg/usr/ --host=$__arch
  make || return 1
  make install || return 1


}
