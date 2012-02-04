# Contributor: Juan Diego Tascon

pkgname=webshell
pkgver=0.9.6
pkgrel=1
pkgdesc="WebShell is a web-based ssh shell."
arch=('i686' 'x86_64')
url="http://www-personal.umich.edu/~mressl/webshell/index.html"
license="GPL"
depends=('python' 'pyopenssl' 'openssl')
source=(http://web-shell.googlecode.com/files/WebShell-$pkgver.zip)
md5sums=('5efa06473bef8dfb2049a15d99b76d8e')

build() {
	cd $srcdir/WebShell-$pkgver/
	mkdir -p $pkgdir/opt/$pkgname
	cp -r * $pkgdir/opt/$pkgname/
}
