# Maintainer: Meskarune <meskarune@gmail.com>

pkgname=ruby-cgi
pkgver=1
pkgrel=1
pkgdesc="A ruby FastCGI dispatcher"
arch=('any')
url="http://derrick.pallas.us/ruby-cgi"
license=('AFL')
depends=('ruby')
source=("http://derrick.pallas.us/$pkgname/$pkgname")
md5sums=('4c4d4427beea74334e9d8a416dfb5ef8')

package() {
	install -D -m755 $pkgname "${pkgdir}/usr/bin/$pkgname"
		  }
