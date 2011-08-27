# Contributor: Justin Goguen <adekoba@hamiltonshells.ca>

pkgname=tagog
pkgver=0.0.6
pkgrel=2
pkgdesc="Discogs audio tagger"
arch=('i686' 'x86_64')
url="http://adekoba.homelinux.org/tagog"
license=('MIT')
depends=('python' 'mutagen')
source=("http://adekoba.homelinux.org/static/tagog/$pkgname-$pkgver.tar.gz")
md5sums=('944759fe7e1e1f7cb4b5239071799bc7')

build() {
	cd $startdir/src/$pkgname-$pkgver

	# Install Tagog
	python setup.py install --root=$startdir/pkg

	# Install MIT License
	install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
