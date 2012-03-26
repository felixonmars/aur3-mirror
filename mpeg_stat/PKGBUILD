# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=mpeg_stat
pkgver=2.2b
pkgrel=2
pkgdesc="A Berkely MPEG Tools bitstream analysis tool."
arch=('i686' 'x86_64')
url="http://bmrc.berkeley.edu/ftp/pub/multimedia/mpeg/"
license=('custom')
depends=('ffmpeg')
source=(http://hpux.connect.org.uk/ftp/hpux/Development/Tools/${pkgname}-${pkgver}/${pkgname}-${pkgver}-src-11.00.tar.gz)
md5sums=('b836282185be404a6eebb55311b49ade')
build() {

	cd $srcdir/${pkgname}-${pkgver}
	make || return 1
	install -m755 -D $srcdir/${pkgname}-${pkgver}/mpeg_stat $pkgdir/usr/bin/mpeg_stat
	install -m755 -D $srcdir/${pkgname}-${pkgver}/mpeg_stat.1 $pkgdir/usr/lib/mpeg_stat.1
}

