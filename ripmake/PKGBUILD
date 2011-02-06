# Maintainer: daniel g. siegel <dgsiegel@gmail.com>
pkgname="ripmake"
pkgver="1.39"
pkgrel=1
license="GPL"
pkgdesc="A fully automatic command line ripping makefile generator for transcode"
depends=('perl' 'transcode>=0.6.2' 'mjpegtools' 'ogmtools' 'mkvtoolnix'\
	 'toolame' 'pgmfindclip' 'chaplin' 'mpglen' )
source=(http://www.lallafa.de/bp/files/$pkgname-$pkgver.gz xvid-bug.patch)

url="http://www.lallafa.de/bp/ripmake.html"
md5sums=('47fd29c1b775f04614b9ae138fa755a2' '1d187cd604701ddcc96dcc361919696d')

build() {
   cd $startdir/src/
   patch -p0 < xvid-bug.patch
   install -D -m755 $startdir/src/$pkgname-$pkgver $startdir/pkg/usr/bin/$pkgname-$pkgver
}
