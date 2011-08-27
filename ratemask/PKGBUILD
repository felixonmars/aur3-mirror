# Contributor: Vladimir Kutyavin <vlkut@bk.ru>
pkgname=ratemask
pkgver=1.0.1
pkgrel=1
pkgdesc="Small tool for generating or decrypt mask for icmp_ratemasks variable"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.frozentux.net/"
depends=('glibc')
source=(http://www.frozentux.net/wp-uploads/fs1/2009/09/$pkgname-101tar.gz)
md5sums=('a602b8e90474e03410a8daa1170b8123')
build() {
  cd $srcdir/$pkgname
    make || return 1
    install -D -m 755 ./ratemask $pkgdir/usr/bin/ratemask || return 1 
}
