# Contributor: BluePeppers (at) archlinx (dot) us
# Contributor: Erus_Iluvatar <erus.iluvatar@gmail.com>

pkgname=cli-msn
pkgver=2.3.2
pkgrel=1
pkgdesc="A CLI msn client"
arch=('i686' 'x86_64')
url="http://mor-pah.net/index.php?file=projects/climsn"
license=('GPL')
depends=('openssl' 'curl' 'ncurses')
source=(http://mor-pah.net/code/CLI-MSN-$pkgver.tar.gz) #Didn't use $pkgname as aur only takes lowercase names
md5sums=('5c53f1b781bff9707319ae1128be6f9b')

build() {
    cd $srcdir/climsn
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}