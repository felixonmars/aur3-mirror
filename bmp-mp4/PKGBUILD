# Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>

pkgname=bmp-mp4
pkgver=20041215
pkgrel=1
pkgdesc="AAC/MP4 plugin for Beep Media Player"
url="http://www.sosdg.org/~larne/w/Plugin_list"
license="GPL"
depends=('bmp' 'automake' 'autoconf' 'libtool')
source=(http://fondriest.frederic.free.fr/fichiers/${pkgname}_${pkgver}.tar.bz2)
md5sums=('63bf78b5827fd9b2189b019642b98447')

build() {
  cd $startdir/src/${pkgname}_${pkgver}
  autoreconf -vifs
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
