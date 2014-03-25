# Maintainer: Matthias Larisch <mail@matthias-larisch.de>

pkgname=rt-plugins
pkgver=0.0.3
pkgrel=1
pkgdesc="Richard's rt-plugins LADSPA plug-ins suite for crossover and equalization for active loudspeakers"
arch=('i686' 'x86_64')
url="http://faculty.tru.ca/rtaylor/rt-plugins/index.html"
license=('GPL')
depends=('ladspa')
groups=('ladspa-plugins')
source=("http://faculty.tru.ca/rtaylor/rt-plugins/$pkgname-$pkgver.tar.gz"
        '0001-Fix-Makefile-to-support-automake-DESTDIR.patch'
        '0002-fix-folder-generation.patch'
          )
sha1sums=(
'2ef7677f5155ba8b730b74738adbafd311a731b3'
'98a5d2a4854840bb17d363ed7dd7f186fcadc598'
'3048383cd124872670f2de78007323b8d3b5dd1e'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/0001-Fix-Makefile-to-support-automake-DESTDIR.patch"
  patch -Np1 -i "$srcdir/0002-fix-folder-generation.patch"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
