# Maintainer: Thomas Glamsch <thomas.glamsch@gmail.com>
# Contributor: aspidites <aspidites[at]inbox.com>
pkgname=usf
pkgver=0.1.6
pkgrel=1
pkgdesc="Ultimate Smash Friends is a game based on pygame, which aims at creating quick and fun multiplayer entertainment. "
arch=('any')
url="http://usf.tuxfamily.org"
license=('GPL3')
depends=('python2-pygame' 'python2-numpy')
optdepends=('pygtk: Character Editor')
conflicts=('usf-bzr')
source=("http://launchpad.net/ultimate-smash-friends/0.1/${pkgver}/+download/ultimate-smash-friends-${pkgver}.tar.gz")
md5sums=('f2a44f58bc2148768f1e08b57a923e43')

build() {
	cd ${srcdir}/ultimate-smash-friends-${pkgver}/usf
	for file in main.py event_manager.py loaders.py memoize.py; do
		sed -i 's/python/python2/1' $file;
	done
}

package() {
	cd ${srcdir}/ultimate-smash-friends-${pkgver}
	python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
