# Maintainer Thomas Schneider <maxmusterm@gmail.com>

pkgname=onemanga-loader
pkgver=0.2
pkgrel=2
pkgdesc="Perl Script to download Mangas from OneManga.com"
url="http://blackwiki.ohost.de/"
arch=('i686' 'x86_64' 'i386')
license=('GPL')
depends=('perl' 'perl-libwww')
makedepends=()
source=(http://blackwiki.bl.ohost.de/blog/wp-content/uploads/2008/10/onemanga-new.pl)
md5sums=()

build() {
  cd $startdir/
  mkdir -p $startdir/pkg/usr/bin/
  cp onemanga-new.pl $startdir/pkg/usr/bin/onemangaloader
  chmod +x $startdir/pkg/usr/bin/onemangaloader
}

