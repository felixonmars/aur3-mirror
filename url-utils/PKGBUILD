#!/bin/sh
#!/usr/bin/makepkg -p
# Maintainer: Matthew Bauer <mjbauer95@gmail.com>
pkgname="url-utils"
pkgver=1
pkgrel=1
pkgdesc="Provides urlencode and urldecode functions. Use with 'echo \$url | urlencode' or 'echo \$url | urldecode'"
arch=('any')
url="http://bauer.dnsdojo.com/Projects/$pkgname"
license=('GPL')
depends=('sh' 'sed')
provides=('urlencode' 'urldecode')
source=('urlencode' 'urldecode')
md5sums=('8c0aea00ce65e24df577a3b479f7768e'
         '0538f2037c548b1633db90fd405959a0')

build() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/urlencode" "${srcdir}/urldecode" "${pkgdir}/usr/bin" 
}
