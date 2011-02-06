# Contributor: Kamil Stachowski <kamil.stachowski@gmail.com>
pkgname=ruby-tpty
pkgver=0.0.1
pkgrel=1
pkgdesc='Another Pty(pseudo terminal) library'
url='http://www.tmtm.org/ruby/tpty/'
arch=('i686' 'x86_64')
license=('Rubys')
depends=('ruby')
makedepends=()
optdepends=()
provides=('ruby-tpty')
conflicts=()
replaces=()
source=(http://www.tmtm.org/ruby/tpty/tpty-$pkgver.tar.gz)
md5sums=('ed7d9b3365ade92c8518e3ce911f49e8')

build() {
	cd $startdir/src/tpty-$pkgver
	ruby extconf.rb
	make
	ruby ./test.rb
	make install DESTDIR="$pkgdir"
}
