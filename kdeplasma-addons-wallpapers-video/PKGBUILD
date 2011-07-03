# Maintainer: heaven <vo.zaeb at gmail.com>

pkgname='kdeplasma-addons-wallpapers-video'
pkgver='1.7'
pkgrel='1'
pkgdesc='Animated video wallpapers for KDE 4'
url='http://kde-look.org/content/show.php/Animated+Video+Wallpaper?content=112105'
arch=('i686' 'x86_64')
license=('GPL')

depends=('ffmpeg' 'kdebase-workspace' 'openssl')
makedepends=('cmake' 'automoc4')

source=('http://kde-look.org/CONTENT/content-files/112105-plasma-video-wallpaper.tar.gz')
md5sums=('392d278419b63cb0b35dc450f8690a76')

build() {
	cd ${srcdir}/plasma-video-wallpaper

	msg 'Starting make...'

	cmake . -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
