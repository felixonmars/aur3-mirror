# Contributor: David Spicer <azleifel at googlemail.com>

pkgname=gstreamer0.10-rtsp-git
_pkgname=gstreamer0.10-rtsp
pkgver=20101020
pkgrel=1
pkgdesc="An RTSP server based on GStreamer with Python and Vala bindings"
arch=('i686' 'x86_64')
url="http://people.freedesktop.org/~wtay/"
license=('LGPL')
depends=('gstreamer0.10-base')
makedepends=('git' 'pkg-config' 'gstreamer0.10-python' 'vala')
optdepends=('gstreamer0.10-python: To utilise the Python bindings'
            'vala: To utilise the Vala bindings')
provides=('gstreamer0.10-rtsp')
conflicts=('gstreamer0.10-rtsp')
options=(!libtool)

_gitroot="git://anongit.freedesktop.org/gstreamer/gst-rtsp-server"
_gitname="gst-rtsp-server"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  [ -d ${srcdir}/${_gitname}-build ] && rm -rf ${srcdir}/${_gitname}-build
  git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  #
  # BUILD
  #
  for _file in $(find . -name *.py); do
     sed -i -e 's|env python$|env python2|' ${_file}
  done

 PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr --without-check --disable-valgrind --disable-debug  --enable-introspection=no
  make
  make DESTDIR=${pkgdir} install
  
  # Install documents
  install -D -m644 NEWS ${pkgdir}/usr/share/doc/${_pkgname}/NEWS
  install -D -m644 README ${pkgdir}/usr/share/doc/${_pkgname}/README
  cp -rpf docs/* ${pkgdir}/usr/share/doc/${_pkgname}

  rm -rf ${srcdir}/${_gitname}-build
}
