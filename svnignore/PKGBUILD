# Contributor: Clément DÉMOULINS <clement@archivel.fr>

pkgname=svnignore
pkgver=1.0.0_beta
_pkgver=1.0.0-beta
pkgrel=1
pkgdesc="Command-line utility to simplify working with svn ignore lists"
arch=(i686)
url="http://svnignore.sourceforge.net/"
license=('MIT')
depends=('rapidsvn') # Need libsvncpp included into rapidsvn
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-${_pkgver}.tar.gz)

md5sums=('0aaec4562af02cc14115ba04b4853de9')

build() {
  cd "$srcdir/$pkgname-${_pkgver}"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -D COPYING $pkgdir/usr/share/licenses/svnignore/COPYING
  install -D README $pkgdir/usr/share/licenses/svnignore/README
}

# vim:set ts=2 sw=2 et:
