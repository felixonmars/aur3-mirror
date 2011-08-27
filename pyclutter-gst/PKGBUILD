# Contributor: Andrew Grigorev <andrew@ei-grad.ru>

pkgname=pyclutter-gst
pkgver=1.0.0
pkgrel=4
pkgdesc="Python bindings to Clutter-GST."
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('GPL')
depends=('clutter>=1.0.0' 'gstreamer0.10' 'clutter-gst>=1.0.0' 'python2>=2.5.0' 'pyclutter' 'gstreamer0.10-python')
source=(http://www.clutter-project.org/sources/$pkgname/1.0/$pkgname-$pkgver.tar.bz2)
md5sums=('b1cc99a70042bb91ad75937405ed64d9')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  find . -name '*.py' -print0|xargs -0 \
      sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
             -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'

  # this is optional here, autoconf2.65-generated script finds python2 well
  # without any hints... can't say that aboud autoconf-2.68..
  export PYTHON=/usr/bin/python2

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

