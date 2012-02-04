# Modified from original gmpc pkgbuild created by tobias <tobias@archlinux.org>
# Contributor: Lukas Miczka <lukascpu@gmail.com>
# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=gmpc-autoplaylist
pkgver=0.15.5.0
pkgrel=1
pkgdesc="The plugin allows you to generate a playlist based on a set of rules."
arch=('i686' 'x86_64')
url="http://sarine.nl/gmpc/"
license="GPL"
depends=(libmpd libxml2 gtk2)
source=("http://download.sarine.nl/Programs/gmpc/0.15.5/${pkgname}-${pkgver}.tar.gz")
md5sums=('4503b2652b047ea410afdf5ac091df38')

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$pkgdir install
}
