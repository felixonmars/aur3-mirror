# Contributor: Francesc Ortiz <francescortiz@gmail.com>
pkgname=tupac
pkgver=0.5.6.2
pkgrel=1
pkgdesc="A cached pacman implementation that boosts some pacman operations: faster searches, AND searches, aur support, colored output, system sanity check, frontend friendly and more..."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tupac"
license=('GPL')
groups=()
depends=('gcc' 'pacman' 'yaourt' 'php' 'libxml2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(https://github.com/downloads/francescortiz/tupac/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('f5211f9dcd1a26396e71d1d8886b511c')

build() {
  cp -r $startdir/src/tupac/* $startdir/pkg/

  chmod +x $pkgdir/usr/bin/tupac
  
  mkdir -p $startdir/pkg/var/lib/tupac

  chmod a+rwx $startdir/pkg/var/lib/tupac
}
