# [cur] Maintainer Michael Walker <mike@yarrtt.com>
# Maintainer Thomas Schneider <maxmusterm@gmail.com>

pkgname=onemanga-loader-mod
pkgver=0.2
pkgrel=2
pkgdesc="Perl Script to download Mangas from OneManga.com. Has support for some more URL schemes, and all prompts are in English."
url="http://blackwiki.ohost.de/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('perl' 'perl-libwww')
conflicts=('onemanga-loader')
makedepends=()
source=('onemangaloader')
md5sums=('c9e3e684dec0a40cd10025d68467ca44')

build() {
  cd $startdir/
  mkdir -p $startdir/pkg/usr/bin/
  cp onemangaloader $startdir/pkg/usr/bin/onemangaloader
  chmod +x $startdir/pkg/usr/bin/onemangaloader
}
