pkgname=rmate
pkgver=1.3
pkgrel=1
pkgdesc="rmate allows activate TextMate from an ssh session"
arch=('any')
license=('unknown')
url='http://blog.macromates.com/2011/mate-and-rmate/'
depends=('ruby')
source=('rmate.rb')
md5sums=('6a03977bd2e61c6bc9f0a2efa4e292cc')

build() {
	cd $srcdir
	[[ -f rmate.rb ]] && mv rmate.rb rmate
}

package() {
	mkdir -p -m 0755 "$pkgdir/usr/bin/"
	install -v -m 0555 -o root -p "$srcdir"/* -t "$pkgdir/usr/bin/"
}
