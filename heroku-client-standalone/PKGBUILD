# Maintainer: Pat Brisbin <pbrisbin@gmail.com>
_pkgname='heroku-client'
pkgname="$_pkgname-standalone"
pkgver=3.7.3
pkgrel=2
pkgdesc="CLI tool for creating and managing Heroku apps"
arch=('any')
url="https://toolbelt.heroku.com/standalone"
license=('MIT')
depends=(ruby)
conflicts=(heroku-client heroku-toolbelt)
source=("https://s3.amazonaws.com/assets.heroku.com/$_pkgname/$_pkgname-$pkgver.tgz")
md5sums=('be175efa88c40c38e3b5f0f9a87ced7c')

package() {
  mkdir -p "$pkgdir"/opt/heroku-client
  cp -r "$srcdir/$_pkgname"/* "$pkgdir"/opt/heroku-client

  mkdir -p "$pkgdir"/usr/bin && cd "$pkgdir"/usr/bin
  ln -s ../../opt/heroku-client/bin/heroku .
}

# vim:set ts=2 sw=2 et:
