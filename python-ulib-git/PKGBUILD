# Contributor: Devaev Maxim <mdevaev@gmail.com>

pkgname=python-ulib-git
pkgver="0.22"
pkgrel=1
pkgdesc="Useful python library"
arch=('any')
url="http://github.com/mdevaev/ulib.git"
license="GPL"
depends=('python')
optdepends=('python-pysocks-git')
makedepends=('python-setuptools' 'git')

_gitroot="git://github.com/mdevaev/ulib.git"
_gitname="ulib"


build() {
	cd $startdir/src
	if [ -d $_gitname ]; then
		msg "Updating local repository..."
		cd $_gitname
		git pull origin master || return 1
		msg "The local files are updated."
		cd ..
	else
		git clone --branch=v$pkgver --depth=1 $_gitroot
	fi

	msg "Git clone done or server timeout"
	msg "Starting make..."

	rm -rf $_gitname-build
	cp -r $_gitname $_gitname-build
	cd $_gitname-build

	python setup.py install --root="$pkgdir" --prefix=/usr
}

