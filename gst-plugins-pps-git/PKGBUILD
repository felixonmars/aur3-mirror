# Maintainer: kevku <kevku@msn.com>
# Contributor:Xiang Yixiang <lovelinux229-at-gmail-dot-com>
pkgname=gst-plugins-pps-git
pkgver=20110302
pkgrel=1
pkgdesc="PPStream plugin for gstreamer"
arch=("i686" "x86_64")
url="http://code.google.com/p/totem-pps/"
license=('GPL')
depends=('gstreamer0.10' 'libppswrapper')
makedepends=('git')
provides=('gst-plugins-pps=0.0.18.2')
conflicts=('gst-plugins-pps')

_gitroot="git://anongit.freedesktop.org/~jinghua/gst-plugins-pps.git"
_gitname="gst-plugins-pps"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 

