# Maintainer: David Roheim <david dot roheim at gmail dot com>
pkgname=zendframework2-manual-en
pkgver=2.3.4
pkgrel=1
pkgdesc="End-User Documentation for ZendFramework2"
arch=('any')
url="http://framework.zend.com/"
license=('BSD')
options=(!strip)
source=("http://packages.zendframework.com/releases/ZendFramework-$pkgver/ZendFramework-$pkgver-manual-en.tgz")
sha256sums=('aad0cfd01bcc7e6b2bc76271853f9aca4bb7770d3039d383cc96ba5317e4f010')

build() {
    true
}

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/share/doc/zendframework2/manual-en"
    cp -R . "$pkgdir/usr/share/doc/zendframework2/manual-en"
    rm "$pkgdir/usr/share/doc/zendframework2/manual-en/ZendFramework-$pkgver-manual-en.tgz"
}
