# Contributor: Zhukov Pavel <gelios@gmail.com>
pkgname=rafkill
pkgver=1.2.3
pkgrel=2
pkgdesc="A vertical scrolling shoot-em up game"
arch=('i686' 'x86_64')
url="http://raptorv2.sourceforge.net/"
license=('GPL')
depends=('gcc' 'allegro')
makedepends=('dumb' 'scons')
source=(http://dl.sourceforge.net/sourceforge/raptorv2/$pkgname-$pkgver.tar.gz rafkill)

md5sums=('1fc57e141e815a1128ceb49c587e6024'
    '1ed2b4382b972bc72d7abf16768bec7e')


build() {
 cd $startdir/src/$pkgname-$pkgver
 install -d $startdir/pkg/usr $startdir/pkg/usr/bin $startdir/pkg/usr/share
 pwd
 mkdir Rafkill
 scons prefix=Rafkill bin=/tmp || return 1
 scons install
 cp -R Rafkill $startdir/pkg/usr/share/
 install -D -m755 ../../rafkill $startdir/pkg/usr/bin
}
