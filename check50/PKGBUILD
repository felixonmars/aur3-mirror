# Maintainer: Joschka Thurner <mail@joschkathurner.de>
pkgname=check50
pkgver=1.19
pkgrel=1
pkgdesc="Code check tool for CS50 / CS50x (Harvard College's Introduction to Computer Science I)"
arch=('any')
url="https://github.com/jthurner/check50"
license=('CCPL')
makedepends=('git')
depends=('nodejs')
source=("$pkgname"::'git://github.com/jthurner/check50.git#commit=9dcfc22a5152aa2f6516f233bbddb46bed4a5019')
md5sums=('SKIP')

prepare() {
    #fix file permissions
    find "$srcdir/$pkgname/SOURCES/opt/" -type f -exec chmod 644 {} \;

    #overwrite php launcher
    echo -e '#!/bin/sh\nexec /usr/bin/node /opt/check50/bin/check50.js "$@"' > "$srcdir/$pkgname/SOURCES/opt/check50/bin/check50"
    chmod 755 "$srcdir/$pkgname/SOURCES/opt/check50/bin/check50"
}


package() {
    install -dm755 "$pkgdir/usr/bin"
    cp -a "$srcdir/$pkgname/SOURCES/opt/" "$pkgdir"
    ln -s "/opt/check50/bin/check50" "$pkgdir/usr/bin/check50"
}
