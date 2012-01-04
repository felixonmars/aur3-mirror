# Maintainer: Leo von Klenze <aur@leo.von-klenze.de>
pkgname=jstestdriver
pkgver=1.3.3d
pkgrel=0
pkgdesc="The goal of JsTestDriver is to build a JavaScript test runner."
arch=(i686 x86_64)
url="http://code.google.com/p/js-test-driver/"
license=('Apache License 2.0')

source=("http://js-test-driver.googlecode.com/files/JsTestDriver-$pkgver.jar")
sha1sums=('2998fb56170148bba5134d58ff8eb1f2ae8c9a12')

build() {
    mkdir -p $pkgdir/opt/jstestdriver
    mkdir -p $pkgdir/usr/bin/
    
    cp JsTestDriver-$pkgver.jar $pkgdir/opt/jstestdriver
    echo -e "#!/bin/sh\n\njava -jar /opt/jstestdriver/JsTestDriver-$pkgver.jar \$*\n" > $pkgdir/opt/jstestdriver/jstestdriver

    chmod 755 $pkgdir/opt/jstestdriver/jstestdriver
    ln -s /opt/jstestdriver/jstestdriver $pkgdir/usr/bin/jstestdriver
}

