# Maintainer: Jannik Heller <scrawl@baseoftrash.de>

pkgname=tuxload
pkgver=1
pkgrel=2
pkgdesc="Console-based downloader for hosting sites like RapidShare"
url="http://git.someserver.de/?p=joker/tuxload;a=summary"
license="GPL"
arch=('any')
depends=('imagemagick' 'perl-libwww' 'libjpeg' 'gocr' 'perl')
makedepends=('git')
install=$pkgname.install
source=()
md5sums=()

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/opt
  git clone git://git.someserver.de/joker/tuxload $pkgdir/opt/tuxload
  mkdir -p $pkgdir/usr/bin
  ln -s /opt/tuxload/bin/tuxload.pl ${pkgdir}/usr/bin/tuxload 
}
