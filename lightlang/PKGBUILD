# Contributor: Nick Marakhovskiy <father@mnv.org.ua>

pkgname="lightlang"
pkgver="0.8.6_rev927"
pkgrel=1
pkgdesc="A system of electronic dictionaries for Linux."
arch=('i686' 'x86_64')
url="http://code.google.com/p/lightlang/"
license=('GPL')
depends=('qt' 'python2' 'python2-qt' 'python2-sip' 'python-xlib' 'sox')
conflicts=('lightlang-svn')
source=(http://lightlang.googlecode.com/files/$pkgname-${pkgver//_/-}.tar.bz2)
md5sums=(451d79894d193f01e3aa38a83e92dc90)

build() {
    cd ${srcdir}/$pkgname-${pkgver//_/-}
    export PYTHON_PROG=/usr/bin/python2
    sed -i 's/python\ \-c/python2 \-c/g' ./configure
    ./configure || return 1
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
}
