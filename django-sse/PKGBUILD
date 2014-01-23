# Maintainer: Julien pouete Godin  <https://github.com/pouete>
# Contributer: Andrei niwibe Antoukh <https://github.com/niwibe>
pkgname=django-sse
pkgver=0.4.1
pkgrel=1
pkgdesc="HTML5 Server-Side Events for Django 1.3+"
arch=('any')
url="https://github.com/niwibe/django-sse"
license=('BSD-3')
depends=( 'python2' 'python2-sse' )
makedepends=('git' 'python2-setuptools' 'python2' )
source=("https://github.com/niwibe/django-sse.git")
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
