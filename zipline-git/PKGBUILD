# Maintainer: perlawk

pkgname=zipline-git
pkgver=0.6
pkgrel=3
pkgdesc="Zipline is a Pythonic algorithmic trading library."
arch=(any)
url="https://github.com/quantopian/zipline"
license=('GPL')
groups=()
makedepends=('git')
depends=('python' 'python-requests' 'python-pandas' 'python-numpy' 'python-pytz'  'python-dateutil' 'python-logbook' 'python-mock' 'python-nose-parameterized' 'python-ta-lib')
provides=()
source=()

_gitroot=https://github.com/quantopian/zipline
_gitname=zipline

prepare() {
	cd "$srcdir"

	if [ !e zipline ]; then
		msg "Connecting to GIT server...."

		if [[ -d "$_gitname" ]]; then
			cd "$_gitname" && git pull origin
			msg "The local files are updated."
		else
			git clone "$_gitroot" "$_gitname"
		fi

		msg "GIT checkout done or server timeout"
		msg "Starting build..."

		rm -rf "$srcdir/$_gitname-build"
		git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	fi
}

build() {
	cd "$srcdir/$_gitname-build"
	python setup.py build
}

package() {
	cd "$srcdir/$_gitname-build"
	python setup.py install --root="$pkgdir/" --optimize=1
}
