# Maintainer: Pat Brisbin <pbrisbin@gmail.com>
_pkgname='heroku-client'
pkgname="$_pkgname-standalone"
pkgver=3.8.2
pkgrel=1
pkgdesc="CLI tool for creating and managing Heroku apps"
arch=('any')
url="https://toolbelt.heroku.com/standalone"
license=('MIT')
depends=(ruby)
conflicts=(heroku-client heroku-toolbelt)
source=("https://s3.amazonaws.com/assets.heroku.com/$_pkgname/$_pkgname-$pkgver.tgz")
md5sums=('636459ff7cecd460b855bf8228c077e5')

package() {
  mkdir -p "$pkgdir"/opt/heroku-client
  cp -r "$srcdir/$_pkgname"/* "$pkgdir"/opt/heroku-client

  mkdir -p "$pkgdir"/usr/bin && cd "$pkgdir"/usr/bin
  ln -s ../../opt/heroku-client/bin/heroku .
}

# vim:set ts=2 sw=2 et:
