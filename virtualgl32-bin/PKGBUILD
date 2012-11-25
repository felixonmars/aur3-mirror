# Maintainer: Constantin Schomburg <me at xconstruct dot net>
pkgname=virtualgl32-bin
_srcname=virtualgl32
pkgver=2.3.2
_srcbranch='2.3.2'
_srcarch='amd64'
pkgrel=1
pkgdesc="32-bit serverside components for 64-bit VirtualGL servers."
arch=('x86_64')
url="http://virtualgl.org"
license=('GPL')
depends=("virtualgl=${pkgver}")
provides=("lib32-virtualgl=${pkgver}")
md5sums=('fc31391d0e773be840186a3d43924af6')
source=("http://downloads.sourceforge.net/project/virtualgl/VirtualGL/${_srcbranch}/${_srcname}_${pkgver}_${_srcarch}.deb")
noextract=(${_srcname}_${pkgver}_${_srcarch}.deb)

build() {
    cd "$srcdir"
    ar x ${_srcname}_${pkgver}_${_srcarch}.deb
    tar xzvf data.tar.gz
    mv usr opt $pkgdir
}
