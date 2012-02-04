# Maintainer: doorknob60 <doorknob60 at gmail dot com>

pkgname=bin32-z26
pkgver=2.13
pkgrel=2
pkgdesc="A Atari 2600 Emulator (bin32 to work on x86_64)"
arch=('x86_64')
url="http://www.whimsey.com/z26/z26.html"
license=('GPL')
depends=('lib32-sdl')
conflicts=('z26')
source=(http://www.mdn.fm/files/132525_ejawc/z26-${pkgver}-${pkgrel}-i686.pkg.tar.gz)
md5sums=('ec2f83375e4bb558bb27b47229b363a2')

build() {
    mkdir -p $startdir/pkg/opt/lib32/usr
    cp -R $startdir/src/usr/* $startdir/pkg/opt/lib32/usr
 mkdir $startdir/pkg/usr
 mkdir $startdir/pkg/usr/bin
 ln -s /opt/lib32/usr/bin/z26 $startdir/pkg/usr/bin
}