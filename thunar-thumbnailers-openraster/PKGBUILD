# $Id: PKGBUILD 1270 2009-08-14 05:57:09Z ebelanger $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: boromil@gmail.com

pkgname=thunar-thumbnailers-openraster
_pkgname=thunar-thumbnailers
pkgver=0.4.1
pkgrel=1
pkgdesc="Provides additional thumbnailers for Thunar. Patched to support OpenRaster"
url="http://goodies.xfce.org/projects/thunar-plugins/thunar-thumbnailers/"
license=('GPL2')
arch=('i686' 'x86_64')
groups=('xfce4-goodies')
depends=('imagemagick' 'ffmpegthumbnailer')
optdepends=('raw-thumbnailer: support for Raw Digital Camera Images'
	'dcraw: support for Raw Digital Camera Image')
makedepends=('raw-thumbnailer' 'dcraw' 'unzip')
conflicts=('thunar-thumbnailers')
options=('!libtool')
install=thunar-thumbnailers.install
source=(http://archive.xfce.org/src/apps/thunar-thumbnailers/0.4/$_pkgname-$pkgver.tar.bz2
0001-Add-OpenRaster-support.patch)
md5sums=('041b8aa0576e15491661741d1868547f'
         '72b3d0cb66813fec70731fbb583e8ba0')

build() {
	cd $srcdir/$_pkgname-$pkgver
    patch -p1 < ../0001-Add-OpenRaster-support.patch

	./configure --prefix=/usr --enable-ffmpeg --enable-raw \
		--libexecdir=/usr/lib/xfce4

	make || return 1
	make DESTDIR=$pkgdir install || return 1
}
