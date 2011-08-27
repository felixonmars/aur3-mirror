# Contributor: Nick Marakhovskiy <father@mnv.org.ua>

pkgname="mysqlsla"
pkgver="2.03"
pkgrel=1
pkgdesc="A tool to parse, filter, analyze and sort MySQL slow, general and binary logs."
arch=('i686' 'x86_64')
url="http://hackmysql.com/mysqlsla"
license=('GPL')
depends=('perl')
source=(http://hackmysql.com/scripts/$pkgname-$pkgver.tar.gz)
md5sums=(f620bee7dfcde6a1236be95cf62daa9b)

build() {
    cd ${srcdir}/$pkgname-$pkgver
    perl Makefile.PL || return 1
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
    mv ${pkgdir}/usr/bin/site_perl/$pkgname ${pkgdir}/usr/bin/
    rm -rf ${pkgdir}/usr/bin/site_perl
    rm -rf ${pkgdir}/usr/lib
}
