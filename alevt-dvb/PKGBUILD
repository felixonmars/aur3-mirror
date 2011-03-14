# Maintainer: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Nagy Gabor <ngaba@@bibl..u-szeged..hu>
# Based on the PKGBUILD of Víctor Martínez Romanos <vmromanos@gmail.com>

pkgname=alevt-dvb
_pkgbasename=alevt
pkgver=1.6.2
pkgrel=5
pkgdesc="A teletext/videotext decoder and browser for DVB cards and X11"
arch=('i686' 'x86_64')
url="http://www.ch4r.de/alevt%20mit%20dvb-t%20unter%20linux.html"
license=('GPL')
depends=('libpng' 'libx11')
optdepends=('zenity: for starting alevt-dvb from the menu (alevt.desktop)')
install=alevt.install
source=(http://www.goron.de/~froese/alevt/$_pkgbasename-$pkgver.tar.gz
	#http://dl.blackbone-ev.de/pluto/alevt-dvb-demux.patch.tar.bz2
	alevt-dvb-demux.patch
	alevt.desktop
	alevt-cap.desktop
	TeletextDVB.sh
	TeletextDVB-capture.sh)
md5sums=('e5a32776e7eff48ec48449b3c3c1cc23'
         '8aa5fdb54949836402db42e969770ad8'
         '66ddc95409e5fd660682bc8b90c877da'
         '1d49c7e53fac043b9d414172fd6790f0'
         '7f6d3e7d62242644919bee6e4c8c1bba'
         'ff7633a9a5e691e8918c6c0602692028')

build() {
  cd $srcdir/$_pkgbasename-$pkgver
  patch -Np1 -i $srcdir/alevt-dvb-demux.patch
  make
}

package() {
  cd $srcdir/$_pkgbasename-$pkgver
  install -m755 -d $pkgdir/usr/{bin,share/man/man1,share/pixmaps,share/applications}
  install -m755 alevt alevt-cap alevt-date $pkgdir/usr/bin
  install -m644 alevt.1x alevt-date.1 alevt-cap.1 $pkgdir/usr/share/man/man1
  install -m644 contrib/mini-alevt.xpm $pkgdir/usr/share/pixmaps
  install -m644 $srcdir/alevt.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/alevt-cap.desktop $pkgdir/usr/share/applications/
  install -m755 $srcdir/TeletextDVB.sh $pkgdir/usr/bin
  install -m755 $srcdir/TeletextDVB-capture.sh $pkgdir/usr/bin
}
