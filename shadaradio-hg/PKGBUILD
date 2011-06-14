# Maintainer: osily <ly50247 at gmail dot com>

pkgname=shadaradio-hg
pkgver=31
pkgrel=1
pkgdesc='A simple radio.'
arch=('i686' 'x86_64')
url='http://code.google.com/p/shadaradio/'
license=('GPL3')
groups=()
provides=()
depends=('qt' 'mplayer')
makedepends=('mercurial')
conflicts=('radioget-svn' 'radioget-hg')

_hgroot="https://shadaradio.googlecode.com/hg/"
_hgrepo="shadaradio"


build() {
  cd $srcdir/

  msg "Creating make environment..."

  rm -rf $srcdir/$_hgrepo-build
  cp -r $srcdir/$_hgrepo $srcdir/$_hgrepo-build

  msg "Starting make..."
  cd $srcdir/$_hgrepo-build


	qmake && make || return 1
	mkdir -p "$pkgdir/usr/bin/" || return 1
	install -D -m755 shadaradio $pkgdir/usr/bin || return 1
}





