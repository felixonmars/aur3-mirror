# Maintainer: Alper KANAT <alperkanat@raptiye.org>

pkgname=facebook-python-sdk-git
pkgver=20120409
pkgrel=1
pkgdesc="Facebook Platform Python SDK by pythonforfacebook"
url="https://github.com/pythonforfacebook/facebook-sdk"
arch=('any')
license=('Apache')
makedepends=("python2-distribute")
depends=("python2")
optdepends=()
conflicts=("facebook-sdk-python" "pyfacebook-git")
provides=("facebook-sdk-python" "pyfacebook-git")

_gitroot="git://github.com/pythonforfacebook/facebook-sdk.git"
_gitname="facebook-python-sdk"

build() {
	cd $srcdir
	msg "Connecting to $_gitname git server..."

	if [ -d $srcdir/$_gitname ]; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cd $srcdir/$_gitname
	python2 setup.py build || return 1
	python2 setup.py install --root=$pkgdir || return 1
}

package() {
    cd $srcdir/$_gitname

    mkdir -p $pkgdir/usr/share/doc/$pkgname

    msg "Copying examples..."
    cp -r examples/ $pkgdir/usr/share/doc/$pkgname/

    msg "Installing docs..."
    install -Dm644 readme.md $pkgdir/usr/share/doc/$pkgname/README.md
}
