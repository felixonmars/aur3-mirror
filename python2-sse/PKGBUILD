# Maintainer: Julien pouete Godin  <https://github.com/pouete>
# Contributer: Andrei niwibe Antoukh <https://github.com/niwibe>
pkgname=python2-sse
pkgver=1.2
pkgrel=2
pkgdesc="Server Sent Events protocol implemetation on python2 and python3 in the same codebase."
arch=('any')
url="https://github.com/niwibe/sse"
license=('BSD-3')
depends=( 'python2' )
makedepends=('git' 'python2-setuptools' 'python2' )
source=("https://github.com/niwibe/sse.git")
md5sums=('SKIP')

build() {
	cd "$srcdir"
	if [[ ! -d "$pkgname-$pkgver" ]]; then
		git clone "$source" "$pkgname-$pkgver"
		msg "Downloaded package sources"
	else 
		cd $pkgname-$pkgver
		git pull origin 
		msg "Updated package sources"
	fi
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -Dm644 LICENSE "$pkgdir/usr/share/license/$pkgname/license.txt"
	sudo python2 setup.py install --root="$pkgdir/" --optimize=1 
}
