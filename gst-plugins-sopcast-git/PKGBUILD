# Maintainer: kevku <kevku@msn.com>
# Contributor:Xiang Yixiang <lovelinux229-at-gmail-dot-com>
pkgname=gst-plugins-sopcast-git
pkgver=20120802
pkgrel=1
pkgdesc="A sopcast plugin for gstreamer"
arch=("i686" "x86_64")
url="http://cgit.freedesktop.org/~jinghua/gst-plugins-sopcast/"
license=('GPL')
depends=('gstreamer0.10' 'gstreamer0.10-base-plugins' 'sopcast')
makedepends=('git' 'intltool')
provides=('gst-plugins-sopcast')

_gitroot="git://people.freedesktop.org/~jinghua/gst-plugins-sopcast"
_gitname="gst-plugins-sopcast"

source=()
md5sums=()

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_gitname-build
  cp -r $_gitname $_gitname-build
  cd $_gitname-build

  ./autogen.sh --prefix=/usr
  make 
}
package(){
  cd $srcdir/$_gitname-build
  make DESTDIR=$pkgdir install
}
