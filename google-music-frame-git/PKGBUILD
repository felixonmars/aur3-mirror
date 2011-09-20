# Contributor: Ray Rashif <schivmeister@gmail.com>

pkgname=google-music-frame-git
pkgver=20110920
pkgrel=1
pkgdesc="Google Music Frame"
arch=(i686 x86_64)
url="https://launchpad.net/google-music-frame"
license=('GPLv3')
depends=('glib2' 'libgee' 'libsoup' 'gtk2' 'libwebkit')
makedepends=('bzr' 'glib2' 'libgee' 'libsoup' 'gtk2' 'libwebkit' 'python2' 'vala' 'libnotify' 'libx11' 'libunique')
provides=()
conflicts=()
replaces=()
options=()
source=()
md5sums=()

build() {
  bzr branch lp:google-music-frame
  cd google-music-frame

  python2 ./waf configure --prefix=/usr
  python2 ./waf build $MAKEFLAGS || return 1
  python2 ./waf install --destdir="$pkgdir"
}
