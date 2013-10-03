# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bombono-dvd-git
pkgver=376.1d6ff07
pkgrel=2
pkgdesc="DVD authoring program with a nice and clean GUI."
url="http://www.bombono.org"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('boost' 'dvd+rw-tools' 'dvdauthor' 'enca' 'ffmpeg' 'gtkmm' 'libdvdread' 'libxml++' 'mjpegtools' 'twolame')
makedepends=('git' 'scons')
provides=('bombono-dvd')
conflicts=('bombono-dvd')
source=('git+git://gitorious.org/bombono-dvd/bombono-dvd.git')
md5sums=('SKIP')

prepare() {
  cd $srcdir/bombono-dvd

  # ffmpeg CodecID fix
  sed -i 's|CodecID|AVCodecID|g' src/mgui/ffviewer.cpp
}

package() {
  cd $srcdir/bombono-dvd
  scons  PREFIX="/usr" CPPFLAGS="-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_FILESYSTEM_VERSION=3" USE_EXT_BOOST=1 DESTDIR="$pkgdir" install
}

pkgver() {
  cd $srcdir/bombono-dvd
  echo $(git rev-list --count master).$(git rev-parse --short master)
}