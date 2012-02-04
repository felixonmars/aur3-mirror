# Maintainer: Brian De Wolf <arch@bldewolf.com>
pkgname=flowd
pkgver=0.9.1
pkgrel=1
pkgdesc="flowd is a small, fast and secure NetFlow collector"
url="http://code.google.com/p/flowd/"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
optdepends=('perl' 'python2')
makedepends=('bison' 'perl' 'python2')
conflicts=()
replaces=()
backup=()
source=("http://flowd.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('a3d0512b5e6d9c7d9e749d9894376ea4')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Dirty hack to make it use GNU bison, otherwise we need byacc which
	# comes from AUR :-/
	sed -i 's/AC_MSG_ERROR\(.*GNU bison not supported\)/AC_MSG_RESULT\1/' configure.ac
	autoreconf
	./configure --prefix=/usr
	make
	
# perl
	( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
	  PERL_AUTOINSTALL=--skipdeps                            \
	  PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
	  PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
	  MODULEBUILDRC=/dev/null

	cd Flowd-perl
	perl Makefile.PL
	make
	)
# python
	python2 setup.py build 

}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install

# perl
	cd Flowd-perl
	make install
	cd ..
# python
	python2 setup.py install --root=$pkgdir
}
