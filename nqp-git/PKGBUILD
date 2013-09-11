# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=nqp-git
pkgver=2013.08.82.g4cf1013
pkgrel=1
pkgdesc="High-level environment to create compilers and libraries for virtual machines"
arch=('i686' 'x86_64')
url='https://github.com/perl6/nqp#readme'
license=('PerlArtistic')
depends=('parrot>=5.5.0')
makedepends=('git' 'perl>=5.8')
conflicts=('nqp')
provides=("nqp=$pkgver")
options=('!makeflags')
source=('nqp::git://github.com/perl6/nqp.git')
md5sums=('SKIP')

pkgver() {
    cd nqp
    git describe --always | sed 's|-|.|g'
}
build() {
    cd nqp
    perl Configure.pl --with-parrot=/usr/bin/parrot --prefix=/usr
    make
}
check() {
    cd nqp
    make test
}
package() {
    cd nqp
    make DESTDIR="$pkgdir/" install
}

