# Maintainer: Patrick Palka <patrick@parcs.ath.cx>
# Development: http://closure.ath.cx/aur-dev

pkgname=subplay
pkgver=2011.03.07
_githash=c4b3f41
pkgrel=1
pkgdesc="CLI for YouTube's subscription feature"
url="http://closure.ath.cx/subplay"
arch=('any')
license=('WTFPL')
depends=('python-beautifulsoup' 'mplayer' 'youtube-dl')
source=("http://pub.lambda.ath.cx/patrick/$pkgname/static/downloads/$pkgname-$pkgver.tar.gz")

package() {
    cd "$srcdir/$pkgname-$_githash"
    install -vDm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

md5sums=('96aa5eb9cb8acfe21a9d5c5b2b81e15d')
