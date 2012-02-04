# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

_realname=galactica
_upstreamver=0.2.1
_gitroot=git://github.com/lovebug356/galactica.git
_gitname=master
pkgname=${_realname}-git
pkgver=20100323
pkgrel=1
pkgdesc="CLI mediaplayer powered by GStreamer"
arch=(i686 x86_64)
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('libxml2>=2.7.3' 'glib2>=2.20.1' 'lua' 'libsoup')
conflicts=("${_realname}")
makedepends=('git' 'intltool' 'pkgconfig' 'gtk-doc' 'gstreamer0.10' 'vala' 'gnome-common')
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
    sh autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
    make || return 1
    make DESTDIR="${pkgdir}" install || return 1
}
