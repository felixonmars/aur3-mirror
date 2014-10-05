# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=gnapi
pkgver=0.2.2
pkgrel=4
pkgdesc='Subtitles downloader from napiprojekt.pl and opensubtitles databases'
arch=('i686' 'x86_64')
url='http://gnapi.sourceforge.net'
license=('GPL')
depends=('gtk2' 'libnotify' 'libsoup' 'libxml2' 'ffmpeg' 'p7zip' 'gconf'
         'gnome-vfs' 'libnautilus-extension')
makedepends=('nautilus')
conflicts=('gnapi-svn')
source=(http://downloads.sourceforge.net/project/gnapi/0.2/gnapi_$pkgver.tar.gz
        ffmpeg.patch)
md5sums=('d320ba232127fb4d2d5febe8c82ad479'
         '42609e19875f2b2efd7e9a2d8b60c748')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../ffmpeg.patch
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
