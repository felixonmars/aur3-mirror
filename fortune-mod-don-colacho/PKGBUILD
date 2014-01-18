# Maintainer: Konrad Scorciapino <konr@konr.mobi>

pkgname=fortune-mod-don-colacho
pkgver=1
pkgrel=1
pkgdesc="Collected aphorisms of Nicolás Gómez Dávila"
arch=('any')
url="https://github.com/konr/don-colacho"
license=('unknown')
depends=('fortune-mod')
group=('fortune-mods')
makedepends=('git')
md5sums=('SKIP')

_gitroot=git://github.com/konr/don-colacho.git
_gitname=don-colacho

build() {
  msg "Cloning"
  git clone "$_gitroot"
}

package() {
  msg "Installing"
  install -D -m644 $srcdir/$_gitname/don-colacho     $pkgdir/usr/share/fortune/don-colacho
  install -D -m644 $srcdir/$_gitname/don-colacho.dat $pkgdir/usr/share/fortune/don-colacho.dat
}
