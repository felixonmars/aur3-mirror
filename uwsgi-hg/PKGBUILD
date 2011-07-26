# -*- shell-script -*-
#
# $Id$
#
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>

python=python2
name=uwsgi

pkgname=$name-hg
pkgver=610
pkgrel=1
pkgdesc="a fast (pure C), self-healing, developer-friendly WSGI server"
arch=(i686 x86_64)
url="http://projects.unbit.it/$name"
license=(GPL2)
depends=("$python" libxml2)
conflicts=(python-$pkgname python-$name)
provides=($name)
makedepends=(gcc mercurial "$python")

_hgroot="http://projects.unbit.it/hg/"
_hgrepo=$name

build() {
  cd $srcdir/$name
  CFLAGS='' make -f Makefile.Py27
  mkdir -p $pkgdir/usr/bin
  install -Dm755 uwsgi $pkgdir/usr/bin/uwsgi
}
