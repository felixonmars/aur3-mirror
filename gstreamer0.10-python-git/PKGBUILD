# Maintainer: Thijs Vermeir <thijsvermeir@gmail.com>

_realname=gstreamer0.10-python
_upname=gst-python
_upver=0.10.24.1
pkgname=${_realname}-git
pkgver=20090820
pkgrel=1
pkgdesc="Python bindings for GStreamer 0.10"
arch=(i686 x86_64)
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
conflicts=("${_realname}")
provides=("${_realname}=${_upver}")
depends=('pygobject>=2.16.1' 'gstreamer0.10-base-git')
makedepends=('pkgconfig')
options=('!libtool')
source=()
md5sums=()
groups=('gstreamer')

_gitroot=git://anongit.freedesktop.org/gstreamer/${_upname}
_gitname=master

build() {
  cd ${srcdir}
  if [ -d ${_upname} ] ; then
    cd ${_upname} && git pull --rebase || return 1
  else
    git clone --depth 1 ${_gitroot} || return 1
    cd ${_upname}
  fi
  sh autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
