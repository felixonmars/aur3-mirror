# Maintainer: Steven Vanden Branden<stevenvandenbrandenstift at gmail dot com>

pkgname=gst-rtsp-server-git
_gitname=gst-rtsp-server
pkgver=1046.23b9d8f
pkgrel=1
pkgdesc="An RTSP server based on GStreamer with Python and Vala bindings"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
license=('GPL')
depends=('gst-plugins-base-git')
makedepends=('pkg-config')
optdepends=('vala-git: To utilise the Vala bindings')
options=(!libtool)
source=('.AURINFO' 'git://anongit.freedesktop.org/gstreamer/gst-rtsp-server')
md5sums=('SKIP' 'SKIP')
pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
build() {
  cd "$_gitname"
  ./autogen.sh --prefix=/usr
  make 
} 
package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
}
