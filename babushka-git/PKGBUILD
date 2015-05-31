# Maintainer: Devin Christensen <quixoten@gmail.com>

pkgname=babushka-git
pkgver=r4539.078b325
pkgrel=1
pkgdesc='Test-driven Sysadmin'
arch=('any')
url='http://babushka.me/'
license=('BSD')
depends=('ruby')
provides=('babushka')
source=(
  $pkgname::git://github.com/benhoskings/babushka.git
  patch
)
sha256sums=(
  SKIP
  4f04b379b6250e5854d1ba9e7fd9dd6ad444f5287b058f5e207608411c4ce7a6
)

pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname
  git apply $srcdir/patch
}

package() {
  cd $srcdir/$pkgname

  install -Dm755 bin/babushka.rb $pkgdir/usr/bin/babushka
  install -Dm644 README.markdown $pkgdir/usr/share/doc/babushka/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/babushka/LICENSE

  cd $srcdir/$pkgname/lib
  find . -iname '*.rb' -exec install -Dm644 {} $pkgdir/usr/lib/babushka/lib/{} \;

  cd $srcdir/$pkgname/deps
  find . -iname '*.rb' -exec install -Dm644 {} $pkgdir/usr/lib/babushka/deps/{} \;
}
