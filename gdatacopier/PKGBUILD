# Contributor: Navin Kumar <navin@alum.rpi.edu>
pkgname=gdatacopier
pkgver=2.1.2
pkgrel=3
pkgdesc="A command-line tool for downloading Google Docs documents in various formats, OpenOffice and PDF among them"
arch=('any')
url="http://code.google.com/p/gdatacopier/"
license=('GPL')
depends=('python2-gdata')
source=("http://gdatacopier.googlecode.com/files/$pkgname-${pkgver}.tgz")
md5sums=('2be67c38c31140c0be942939cd62392c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i 's:^#!/usr/bin/env python:#!/usr/bin/python2:g' *.py
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -d "$pkgdir/opt/Google/gdatacopier"
    install -m755 *.py "$pkgdir/opt/Google/gdatacopier"
    install -d "$pkgdir/usr/bin"
    for _i in gcp gls gmkdir gmv grm; do
        ln -s /opt/Google/gdatacopier/${_i}.py "$pkgdir/usr/bin/$_i"
    done
}
