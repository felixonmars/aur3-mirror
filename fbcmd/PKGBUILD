# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Paul Burton <paulburton89@gmail.com>

pkgname=fbcmd
pkgver=1.1
_pkgver=1-1
pkgrel=1
pkgdesc="A Command Line Interface (CLI) for Facebook"
arch=('any')
url="http://fbcmd.dtompkins.com"
license=('GPL3')
depends=('php')
install=$pkgname.install
source=($url/downloads/$pkgname-$_pkgver.zip
        $pkgname-script)
md5sums=('b2172219e66db88905a84737804ea206'
         '66960b96b4f0dd4e3693362e2996197d')

package() {
  install -dm 755 "$pkgdir"/usr/share/$pkgname
  install -Dm 755 "$srcdir"/$pkgname-script "$pkgdir"/usr/bin/$pkgname
  install -Dm 775 "$srcdir"/$pkgname/$pkgname.php "$pkgdir"/usr/lib/$pkgname.php

  cp -r "$srcdir"/$pkgname/{${pkgname}_update.php,facebook,support} "$pkgdir"/usr/lib/
  cp "$srcdir"/$pkgname/{filelist.txt,gpl.txt,readme.txt} "$pkgdir"/usr/share/$pkgname/
}
