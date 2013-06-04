# Maintainer: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=simpleswitcher-git
_gitname=simpleswitcher
pkgver=20130530
pkgrel=1
pkgdesc="simple EWMH window switcher"
arch=('i686' 'x86_64')
url="http://github.com/seanpringle/simpleswitcher"
license=('MIT')
depends=('libx11' 'libxft' 'freetype2')
makedepends=('git')
provides=('simpleswitcher')
source=("git://github.com/seanpringle/simpleswitcher.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm 755 $_gitname "$pkgdir/usr/bin/simpleswitcher"
  gzip -c "$_gitname.1" > "$_gitname.1.gz"
  install -Dm644 "$_gitname.1.gz" "$pkgdir/usr/share/man/man1/$_gitname.1.gz"
}
