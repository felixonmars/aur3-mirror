# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=pdf-parser
pkgver=0.4.3
pkgrel=1
pkgdesc="Parse a PDF document to identify the fundamental elements used in the analyzed file"
arch=(any)
url=http://blog.didierstevens.com/programs/pdf-tools/
license=('custom:public domain')
depends=(python2)
source=(https://didierstevens.com/files/software/${pkgname}_V${pkgver//./_}.zip
    LICENSE)
sha256sums=('1416624938359fdd375108d922350d1b7b0e41b3a40a48f778d6d72d8a405de6'
            'f9592b658ab5070cfc84580c383c0cdb75e8e0dc8d67e00743bf83430e640170')
sha512sums=('3df3f2210461989cd8dc8de140d251b9f57761850dc98adafc3557d9e44dd16c276cd4fcaa4931ec4213b66475c3839d17dc79e47a078f752a2fcd82308cf9e5'
            '81c04aad50b9a4a702b53cc9a155d5ae87dc35db114e0a11ae1249268adecefbe2f0581fa7147dddf5399ae36e21ff089d0c11037f239be806146bddf4023375')

prepare() {
    sed -i 's:^#!/usr/bin/python$:&2:' $pkgname.py
}

package() {
    install -Dm755 $pkgname.py "$pkgdir"/usr/bin/$pkgname
}
