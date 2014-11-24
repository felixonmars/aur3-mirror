# Maintainer: Thomas Haider <t.haider at deprecate dot de>
# Contributor: Mateusz Paluszkiewicz <aifam96 at gmail dot com>

pkgname=valama-git-webkit2gtk
pkgver=20141123.g8021d16
pkgrel=1
pkgdesc="Next generation Vala IDE"
arch=('i686' 'x86_64')
url="https://github.com/Valama/valama"
license=('GPL3')
depends=('vala' 'libgee' 'gdl' 'gtksourceview3' 'clutter-gtk' 'glade' 'webkit2gtk')
makedepends=('git' 'cmake' 'intltool')
source=(git://github.com/TheAifam5/valama.git)
md5sums=('SKIP') 
install=valama.install

pkgver() {
  cd $srcdir/valama
  git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
}

build() {
  cd $srcdir/valama
  mkdir build
  cd build
  cmake -DPOSTINSTALL_HOOK=OFF -DCMAKE_INSTALL_PREFIX=/usr ..
  make -j2  
}

package() {
  cd "$srcdir/valama/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
