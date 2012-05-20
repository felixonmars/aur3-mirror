# Maintainer: Anton Novikov <random.plant@gmail.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

_realname=gstreamer0.11
_upstreamver=0.11.35.1
pkgname=${_realname}-git
pkgver=20120520
pkgrel=1
pkgdesc="GStreamer Multimedia Framework"
arch=(i686 x86_64)
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('libxml2' 'glib2')
optdepends=('sh: feedback script')
conflicts=("${_realname}")
makedepends=('git' 'intltool' 'pkgconfig' 'gtk-doc' 'gobject-introspection')
provides=("${_realname}=${_upstreamver}")
options=('!libtool')
groups=('gstreamer')

_gitroot=git://anongit.freedesktop.org/gstreamer/gstreamer
_gitbranch=0.11

build() {
    cd ${srcdir}
    if [ -d gstreamer ] ; then
      cd gstreamer && git pull && cd ..
    else
      git clone --branch $_gitbranch --depth 1 $_gitroot
    fi

  rm -rf build
  cp -r gstreamer build
  cd build

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib \
    --with-package-name="GStreamer (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/" \
    --disable-gtk-doc --disable-static --disable-tests

    make
}

check() {
  cd "${srcdir}/build"
  make check
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  #Remove unversioned gst-* binaries to get rid of conflicts
  cd "${pkgdir}/usr/bin"
  for bins in `ls *-0.11`; do
    rm -f ${bins/-0.11/}
  done
}
