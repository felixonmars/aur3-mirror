# Maintainer: Hubert Maraszek <marach5 at gmail dot com>
pkgname=shoot
pkgver=1.0
pkgrel=1
pkgdesc="A bash script that takes a screenshot and uploads it to Imgur"
arch=('any')
url="http://sirupsen.com/a-simple-imgur-bash-screenshot-utility/"
license=('unknown')
depends=('scrot' 'xclip')
optdepends=('libnotify')
source=('http://sirupsen.com/static/misc/shoot')
md5sums=('a564f5488f9dc752c0a165e2dc533e6d')

package(){
	install -D "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

