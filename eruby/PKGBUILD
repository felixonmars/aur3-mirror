# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>

pkgname=eruby
pkgver=1.0.5
pkgrel=2
pkgdesc="Implementation of eRuby (embedded ruby) written in C."
url="http://modruby.org/en/index.rbx/eruby/"
license=('GPL' 'LGPL')
arch=('i686' 'x86_64')
depends=('ruby')
makedepends=()
source=(http://modruby.org/archive/${pkgname}-${pkgver}.tar.gz patch01.patch)
md5sums=('af294fe34dc6cf24228aec95167b3099'
         '8a222382a5fd662ae6e9b386edaedede')

build()
{
    cd "$srcdir/$pkgname-$pkgver"
  
    patch -p1 -N < "$srcdir/patch01.patch"

	./configure.rb || return 1
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}

