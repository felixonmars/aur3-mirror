# Contributor: Danny Arnold <despairblue@skeil.de>
# Maintainer: Danny Arnold
pkgname=i3power-git
pkgver=20131210
pkgrel=1
pkgdesc="Program checking the batttery time left and performing actions if below a certain amount."
arch=('any')
url="https://github.com/despairblue/i3power"
license=('APACHE')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -u -v -x github.com/despairblue/i3power
}

package() {
  install -Dm755 bin/i3power "$pkgdir/usr/bin/i3power"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}
