# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

pkgname=sic-hg
pkgver=110
pkgrel=1
pkgdesc='Extremely simple IRC client, mercurial dev. version'
arch=('i686' 'x86_64')
url='http://www.suckless.org/programs/sic.html'
license=('MIT')
depends=()
makedepends=('mercurial')
source=()
md5sums=()

_hgrepo=sic
_hgroot='http://hg.suckless.org'

build() {
  cd $srcdir/$_hgrepo
  make
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -Dm0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
