#Maintainer: Joni Lapilainen <joni.lapilainen@gmail.com>

pkgname=gstreamer0.10-openmax-git
pkgver=20120110
pkgrel=1
pkgdesc="GStreamer OpenMAX is a GStreamer plug-in that allows communication with OpenMAX IL components"
arch=('arm' 'armv7h')
license=('LGPL')
url="http://freedesktop.org/wiki/GstOpenMAX"
depends=('gstreamer0.10' 'libxml2')
makedepends=('pkgconfig' 'git' 'libxml2')
source=()
md5sums=()
provides=('gstreamer0.10-openmax' 'gstreamer0.10-openmax-git')

_gitroot="git://anongit.freedesktop.org/gstreamer/gst-openmax"
_gitname="gst-openmax"

build() {

 msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

cd $startdir/src/$_gitname

  sh autogen.sh --noconfigure || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

}

