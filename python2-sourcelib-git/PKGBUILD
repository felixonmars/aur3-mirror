# Contributor : Devaev Maxim <mdevaev@gmail.com>

pkgname=python2-sourcelib-git
pkgver=20121011
pkgrel=1
pkgdesc="Python implementation of Valve Source Dedicated Server Query/RCON/Log protocols"
arch=('any')
url="https://github.com/frostschutz/SourceLib"
license="GPL"
depends=("python2")
makedepends=('git' 'python2-distribute')
source=()
md5sums=()

_gitroot="git://github.com/frostschutz/SourceLib.git"
_gitname="SourceLib"


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
	mkdir $_gitname-build
	cp -r $_gitname $_gitname-build
	cd $_gitname-build

	cat > setup.py <<EOF
from setuptools import setup

setup(
	name="SourceLib",
	version=$pkgver,
	url="https://github.com/frostschutz/SourceLib",
	license="GPL",
	author="Andreas Klauer",
	author_email="andreas.klauer@metamorpher.de",
	description="$pkgdesc",
	packages=["SourceLib"],
	platforms="any",
	classifiers=[
		"Topic :: Software Development :: Libraries :: Python Modules",
		"Development Status :: 3 - Alpha",
		"Programming Language :: Python",
		"Operating System :: OS Independent"
	]
)
EOF

	python2 setup.py install --root="$pkgdir" --prefix=/usr
}
