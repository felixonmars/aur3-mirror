# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-docopt-git
pkgver=20120410
pkgrel=1
pkgdesc="Pythonic option parser, that will make you smile"
arch=(any)
url="https://github.com/halst/docopt"
license=('MIT')
depends=('python2')
makedepends=('git')
makedepends=('python2-distribute')

_gitroot="https://github.com/halst/docopt.git"
_gitname="docopt"

build() {
	cd "$srcdir"

	msg "Connecting to GIT server...."

	if [ -d $srcdir/$_gitname ]; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone --depth=0 $_gitroot $_gitname
		cd $_gitname
	fi

	msg "GIT checkout done or server timeout"

	_site_packages=$(python2 -sSc 'import site; print site.getsitepackages()[0]')
	install -Dm0644 docopt.py "$pkgdir$_site_packages/docopt.py"
	install -Dm0644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
