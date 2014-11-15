# Maintainer: Pat Brisbin <pbrisbin@gmail.com>
_pkgname='heroku-client'
pkgname="$_pkgname-standalone"
pkgver=3.15.3
pkgrel=1
pkgdesc="CLI tool for creating and managing Heroku apps"
arch=('any')
url="https://toolbelt.heroku.com/standalone"
license=('MIT')
depends=(ruby)
conflicts=(heroku-client heroku-toolbelt)
source=("https://s3.amazonaws.com/assets.heroku.com/$_pkgname/$_pkgname-$pkgver.tgz")

package() {
  mkdir -p "$pkgdir"/opt/heroku-client
  cp -r "$srcdir/$_pkgname"/* "$pkgdir"/opt/heroku-client

  mkdir -p "$pkgdir"/usr/bin && cd "$pkgdir"/usr/bin
  ln -s ../../opt/heroku-client/bin/heroku .
}

md5sums=('707ec6fd915acb32ac61bc1ba0277e1b')
