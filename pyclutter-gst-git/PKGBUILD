# Contributor: Andrew Grigorev <andrew@ei-grad.ru>

pkgname=pyclutter-gst-git
pkgver=20101022
pkgrel=2
pkgdesc="Python bindings to Clutter-GST (git version)."
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('LGPL')
depends=('python>=2.5.0 clutter>=1.0.0 clutter-gst>=0.10.0 pyclutter gstreamer0.10 gstreamer0.10-python' )
options=()
provides=('pyclutter-gst')
conflicts=('pyclutter-gst')
source=()
md5sums=()

_gitroot="http://git.clutter-project.org/bindings/pyclutter-gst"
_gitname="pyclutter-gst"

build() {
  cd $srcdir
  msg "Connecting to git.clutter-project.org GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  find . -name '*.py' -print0|xargs -0 \
      sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
             -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'

  export PYTHON=/usr/bin/python2

  msg "Starting build"
  ./autogen.sh
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  rm -rf $srcdir/$_gitname-build
}
