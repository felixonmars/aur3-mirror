# Maintainer: Patrick Palka <patrick@parcs.ath.cx>
# Development: http://closure.ath.cx/aur-dev

pkgname=cliweather
pkgver=2011.05.05
_githash=5880d3a
pkgrel=1
pkgdesc="Simple CLI for Google's weather API"
url="http://closure.ath.cx/cliweather"
arch=('any')
license=('WTFPL')
depends=('python')
source=("http://pub.lambda.ath.cx/patrick/$pkgname/static/downloads/$pkgname-$pkgver.tar.gz")

package() {
    cd "$srcdir/$pkgname-$_githash"
    install -vDm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

md5sums=('faf9f16e86e48906708b07f381cedebc')
