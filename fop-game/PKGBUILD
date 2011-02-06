# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=fop-game
pkgver=0.5
pkgrel=1
pkgdesc='A dungeon-crawling game based on the 8-bit Atari computer game "Dandy"'
arch=('i686' 'x86_64')
url="http://www.newbreedsoftware.com/fop/"
license=('GPL')
depends=('sdl_image')
source=(ftp://ftp.tuxpaint.org/unix/x/fop/src/fop-$pkgver.tar.gz)
md5sums=('33f0257ed76c82e0f63b761e4080f853')

build() {
  cd fop-$pkgver

  sed 's|"data|"/usr/share/fop|g' -i src/fop.c
  sed 's|=-Wall -O2|+=|g' -i Makefile

  find -type f -exec chmod 644 {} \;
  find -type d -exec chmod 755 {} \;

  make || return 1

  mkdir -p "$pkgdir"/usr/{bin,share/{doc,fop}}
  install -m755 fop "$pkgdir"/usr/bin/
  cp -rf data/. "$pkgdir"/usr/share/fop/
  cp -rf docs/ "$pkgdir"/usr/share/doc/fop/
}

# vim:set ts=2 sw=2 et:
