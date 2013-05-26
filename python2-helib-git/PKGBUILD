# Contributor: Devaev Maxim <mdevaev@gmail.com>

pkgname=python2-helib-git
pkgver=20130526
pkgrel=2
pkgdesc="Useful python library"
arch=('any')
url="http://github.com/mdevaev/helib.git"
license="GPL"
depends=('python2' 'python2-cjson')
makedepends=('git')

_gitroot="git://github.com/mdevaev/helib.git"
_gitname="helib"


build() {
	cd $startdir/src
	if [ -d $_gitname ]; then
		msg "Updateing local repository..."
		cd $_gitname
		git pull origin master || return 1
		msg "The local files are updated."
		cd ..
	else
		git clone $_gitroot --depth=1
	fi

	msg "Git clone done or server timeout"
	msg "Starting make..."

	rm -rf $_gitname-build
	cp -r $_gitname $_gitname-build
	cd $_gitname-build

	python2 setup.py install --root="$pkgdir" --prefix=/usr
}

