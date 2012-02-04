# Contributor: Ray Rashif <schivmeister@gmail.com>

pkgname=google-music-frame-bzr
pkgver=20110920
pkgrel=5
pkgdesc="Google Music Frame"
arch=(i686 x86_64)
url="https://launchpad.net/google-music-frame"
license=('GPLv3')
depends=()
makedepends=('bzr' 'glib2' 'libgee' 'libsoup' 'gtk2' 'libwebkit' 'python2' 'vala' 'libnotify' 'libx11' 'libunique')
provides=()
conflicts=()
optdepends=('gnome-shell-extension-mediaplayer-git: Gnome Shell integration')
replaces=('google-music-frame-git')
options=()
source=()
md5sums=()
install=google-music-frame-bzr.install

build() {
  bzr branch lp:google-music-frame
  cd google-music-frame

  python2 ./waf configure --prefix=/usr
  python2 ./waf build $MAKEFLAGS || return 1
  python2 ./waf install --destdir="$pkgdir"
}
