# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=advanceutils
pkgver=0.106.1
pkgrel=1
pkgdesc="Utilities for AdvanceMAME and AdvanceMenu"
arch=('i686' 'x86_64')
url="http://advancemame.sourceforge.net/doc-advmame.html"
depends=('sdl' 'alsa-lib' 'expat')
makedepends=('nasm')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/advancemame/advancemame-$pkgver.tar.gz)
md5sums=('dc0997a36efe9263ca1d072ab417a318')

build() {
  cd $startdir/src/advancemame-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  install -D -m755 obj/cfg/linux/blend/advcfg  $startdir/pkg/usr/bin/advcfg
  install -D -m755 obj/v/linux/blend/advv $startdir/pkg/usr/bin/advv
  install -D -m644 doc/advcfg.1 $startdir/pkg/usr/man/man1/advcfg.1
  install -D -m644 doc/advv.1 $startdir/pkg/usr/man/man1/advv.1
}

