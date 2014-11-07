# Maintainer: David McMackins <david@delwink.com>
pkgname=coinfetch-delwink
pkgver=2.1.2
pkgrel=1
pkgdesc="Gets BTer exchange rates between cryptocurrencies (Delwink Edition)"
arch=(any)
url="http://delwink.com/software/coinfetch.html"
license=('MIT')
depends=('python' 'python-requests')
source=(http://delwink.com/dl/coinfetch-$pkgver.tar.gz)
sha512sums=('9d63db714e19d241fc580e9e8082638dabed5af3f648eac6643230aad1c2144beeaf4fdee60145b9b4f9fa027fc6661b9fe6c9a7f5869d73f49ddc16211469bc')

package() {
    cd "$srcdir/coinfetch-del$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
