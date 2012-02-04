# Contributor: Philipp Überbacher <hollunder at gmx dot at>
# Maintainer: Mario Blättermann <mariobl@gnome.org>

pkgname=wmdocklib
_pkgname=pywmdockapps
pkgver=1.21
pkgrel=2
pkgdesc="Library for windowmaker dockapps using python."
arch=('i686' 'x86_64')
url="http://pywmdockapps.sourceforge.net/old-index.html"
license=('GPL')
depends=('python2' 'libxpm')
makedepends=()
optdepends=()
provides=()
conflicts=()
source=(http://downloads.sourceforge.net/pywmdockapps/$_pkgname-$pkgver.tar.gz)
md5sums=('ba2c6a16e3fdd5798f3b9d2334d73b8e')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}

# vim:set ts=2 sw=2 et:
