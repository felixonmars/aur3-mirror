# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Björn Franzke <daklicker@googlemail.com>

pkgname=spring-mod-exex
epoch=1
pkgver=0.46
pkgrel=2
pkgdesc="Expand and Exterminate"
arch=(i686 x86_64)
url="http://spring.clan-sy.com/wiki/Expand_and_Exterminate"
license=('GPL')
depends=(spring spring-ota)
noextract=('EEv46.sd7')
#source=("http://xn--d-bga.su/EEv46.sd7") # Original source, but doesn't work with recent versions of spring
source=(EEv46.sd7::http://springfiles.com/sites/default/files/downloads/spring/games/ExpandandExterminatev46_0.82.6.1.sd7) # Latest update
#md5sums=('3ea564fc8f9bc9f5e5c1ef344bf0c14c')
md5sums=('217051eb00b6094a617a195834b612b3')

build() {
  install -D -m 755 $srcdir/EEv46.sd7 $pkgdir/usr/share/spring/mods/EEv46.sd7
}

