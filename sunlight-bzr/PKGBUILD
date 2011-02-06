pkgname=sunlight-bzr
_realname=realtimesunlightwallpaper
pkgver=16
pkgrel=1
pkgdesc="A simple but useful application which retrieve an image from the internet and set it as a wallpaper every 30 minutes. "
arch=('i686' 'x86_64')
url="http://realtimesunlightwallpaper.weebly.com"
license=('other')
depends=()
makedepends=()
conflicts=('sunlight')
_bzrtrunk=https://launchpad.net/realtimesunlightwallpaper/trunk
_bzrmod=$pkgname
md5sums=()

build() {
  cd $startdir/src/
  msg "Connecting to the server...."
  bzr co $_bzrtrunk $_bzrmod
  cd $_bzrmod
  msg "Starting make..."
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/icons/
  make || return 1
  make DESTDIR=$pkgdir install
}


