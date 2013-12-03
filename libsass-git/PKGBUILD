# Maintainer: philanecros <philanecros@gmail.com>
pkgname=libsass-git
_pkgname=libsass
pkgver=0.r1118.8ded40a
pkgrel=1
pkgdesc="A C implementation of a Sass compiler"
arch=('i686' 'x86_64')
url="http://github.com/hcatlin/libsass"
license=('CUSTOM')
provides=('${_pkgname}')
conflicts=('${_pkgname}')
replaces=('${_pkgname}')
source=("$_pkgname"::'git://github.com/hcatlin/libsass.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
        aclocal
        autoconf
        autoheader
        automake --add-missing
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
        install -D "LICENSE" "$pkgdir/usr/share/licenses/libsass/LICENSE"
}
