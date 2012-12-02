# Maintainer: Axilleas Pipinellis <axilleas@archlinux.info>

pkgname=episode-renamer
pkgver=0.4.5
pkgrel=1
pkgdesc="TV episode renamer SCRIPT"
arch=(any)
url="https://github.com/skorokithakis/episode-renamer"
license=('BSD')
depends=('python2' 'python2-simplejson' 'python2-beautifulsoup3')
makedepends=('python2-distribute')
optdepends=('atomicparsley: To set all the correct tags')
provides=('episoderenamer')
source=("http://pypi.python.org/packages/source/e/episode-renamer/$pkgname-$pkgver.tar.gz")
md5sums=('e63a4b24b759b6264fc4ca067fd7d1cb')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i "s/Soup==/Soup>=/" setup.py
  python2 setup.py install --root="${pkgdir}" -O1 
}

