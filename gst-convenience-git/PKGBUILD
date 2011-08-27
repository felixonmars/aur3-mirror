# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

_realname=gst-convenience
_upstreamver=0.10.0
_gitroot=git://git.collabora.co.uk/git/user/edward/gst-convenience.git
_gitname=master
pkgname=${_realname}-git
pkgver=20100114
pkgrel=1
pkgdesc="High-level GStreamer convenience libs/plugins"
arch=(i686 x86_64)
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('libxml2>=2.7.3' 'glib2>=2.20.1')
conflicts=("${_realname}")
makedepends=('git' 'cvs' 'intltool' 'pkgconfig' 'gtk-doc' 'gstreamer0.10' 'gstreamer0.10-base')
provides=("${_realname}=${_upstreamver}")
options=('!libtool')
source=()
md5sums=()
groups=('gstreamer')

build() {
    cd $srcdir
    if [ -d $_realname ] ; then
      cd $_realname && git pull --rebase || return 1
    else
      git clone --depth 1 $_gitroot || return 1
      cd $_realname
    fi
    sh autogen.sh || return 1
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
    make || return 1
    make DESTDIR="${pkgdir}" install || return 1
}
