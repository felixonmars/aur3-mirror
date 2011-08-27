# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=rawdog-darcs
pkgver=20101123
pkgrel=1
pkgdesc="RSS Aggregator Without Delusions Of Grandeur"
arch=('any')
url="http://offog.org/code/rawdog.html"
license=('GPL' 'LGPL')
depends=('python2')
makedepends=('darcs')
provides=('rawdog')
conflicts=('rawdog')
install=$pkgname.install

_darcstrunk="http://offog.org/darcs"
_darcsmod="rawdog"

build() {
	cd "$srcdir"

	msg "Checking for previous build"

	if [[ -d $_darcsmod/_darcs ]]
	then
		msg "Retrieving missing patches"
		cd $_darcsmod
		darcs pull -a $_darcstrunk/$_darcsmod
	else
		msg "Retrieving complete sources"
		darcs get --partial --set-scripts-executable $_darcstrunk/$_darcsmod
		cd $_darcsmod
	fi

	rm -rf "$srcdir/$_darcsmod-build"
	cp -r "$srcdir/$_darcsmod" "$srcdir/$_darcsmod-build"
	cd "$srcdir/$_darcsmod-build"

	msg "Starting build"

	# BUILD
	cd "$srcdir/$_darcsmod-build"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_darcsmod-build"
	python2 setup.py install --prefix=/usr --root="$pkgdir"
	install -Dm644 config "$pkgdir/usr/share/$pkgname/config"
	install -Dm644 style.css "$pkgdir/usr/share/$pkgname/style.css"
}
