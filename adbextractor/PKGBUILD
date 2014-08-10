# Maintainer: Dan Z <dzwell@zwell.net>

pkgname=adbextractor
_pkgname=android-backup-extractor
pkgver=20140630
pkgrel=1
pkgdesc="Android adb backup extractor and creator"
arch=('any')
conflicts=('abe')
url="http://sourceforge.net/projects/adbextractor/"
license=('Apache License v2.0')
# Note: needs java 7, but there are too many possible packages.
#depends=('java-runtime-headless>=7')
optdepends=('star: For repacking a valid .tar archive for AB conversion.'
            'pax: For repacking a valid .tar archive for AB conversion.')
source=(http://downloads.sourceforge.net/project/$pkgname/$_pkgname-$pkgver-bin.zip)
md5sums=('9865127beb5bfb0662c1b5d85d65aa12')

build() {
 cd "$srcdir"/$_pkgname-$pkgver-bin
 echo "#!/bin/bash
java -jar /usr/share/$pkgname/abe.jar \"\$@\"" > abe
}

package() {
 mkdir -p "$pkgdir"/usr/share/$pkgname
 mkdir -p "$pkgdir"/usr/bin
 mkdir -p "$pkgdir"/usr/share/$pkgname/perl

 cd "$srcdir"/$_pkgname-$pkgver-bin
 install -m 755 perl/* "$pkgdir"/usr/share/$pkgname/perl
 install -m 644 -t "$pkgdir"/usr/share/$pkgname abe.jar LICENSE README.TXT
 install -m 755 -t "$pkgdir"/usr/bin adb-split.sh abe
}

