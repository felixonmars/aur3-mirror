# Shoes RAISINS PKGBUILD for Arch Linux

# Contributor: Devyn Cairns <devyn.cairns@gmail.com>

_revision=(1168 586c16f86d19e3200465f8ef8da7865c881f4bb1) # _revision=(number hash)

pkgname=shoes-policeman
pkgver=2.0.r${_revision[0]}
pkgrel=2
pkgdesc="An artsy GUI framework for Ruby, based on ideas from NodeBox and Processing."
arch=(i686)
url="http://shoooes.net/"
license=('unknown')
depends=(ruby rubygems gtk cairo giflib libjpeg vlc sqlite3)
makedepends=(rake gcc)
source=(http://github.com/why/shoes/tarball/${_revision[1]})
md5sums=(f3df90fcdc13789863f32523299fc7fc)

build() {
    cd ${startdir}/src/why-shoes-${_revision[1]}||return 1
    rake build clean||return 1
    make -f platform/nix/Makefile PREFIX=/usr DESTDIR=${startdir}/pkg install||return 1
}

