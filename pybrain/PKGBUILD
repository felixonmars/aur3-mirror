# Contributor: Kamil Stachowski <kamil.stachowski@gmail.com>

pkgname=pybrain
pkgver=0.3.1
pkgrel=1
pkgdesc="Python-Based Reinforcement Learning, Artificial Intelligence and Neural Network Library"
url="http://pybrain.org/"
arch=('i686' 'x86_64')
license=('other')
provides=('pybrain')
conflicts=()
replaces=()
depends=('python2-scipy' 'python2-setuptools')
source=()
md5sums=()

_gitname='pybrain'
_gitroot='git://github.com/pybrain/pybrain.git'

build() {
	msg "Connecting to Git server..."
	if [ -d "$srcdir/$pkgname" ]; then
		cd "$srcdir/$pkgname" && git pull origin || return 1
	else
		git clone "$_gitroot" || return 1
	fi
	msg "Git checkout done or server timeout"

	cd "$srcdir/$pkgname"		&&
	python2 setup.py install --root="$pkgdir"
}
