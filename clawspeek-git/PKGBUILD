# Maintainer: Richard Schwab <mail NOSPAM w.tf-w.tf>

pkgname=clawspeek-git
pkgver=3.978f5df
pkgrel=1
pkgdesc="Decode obfuscated claws-mail passwords (see ~/.clawsmail/accountrc)"
arch=('i686' 'x86_64')
url="https://github.com/mones/clawspeek"
license=('GPL3')
makedepends=('git')
provides=(clawspeek)
conflicts=(clawspeek)
source=(git://github.com/mones/clawspeek)
md5sums=(SKIP)

pkgver() {
  cd "${pkgname%-*}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${pkgname%-*}"
  make
}

package() {
  cd "${pkgname%-*}"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
