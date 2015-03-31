
pkgname=tab
pkgver=r135.dbe9d06
pkgrel=1
pkgdesc="A modern text processing language that's similar to awk in spirit. (But not similar in design philosophy, implementation or syntax.)"
arch=('x86_64' 'i686')
url="https://bitbucket.org/tkatchev/tab"
license=('BSL')
groups=()
depends=()
makedepends=('git' 'gcc')
provides=('tab')
conflicts=('tab')
source=("$pkgname::git+https://bitbucket.org/tkatchev/tab.git")
md5sums=(SKIP) #generate with 'makepkg -g'

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  strip tab
  install -D tab "${pkgdir}/usr/bin/tab"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
