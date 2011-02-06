# Contributor: muflax <muflax@gmail.com>
pkgname=scilab-nogui
pkgver=5.1.1
pkgrel=1
pkgdesc="Scilab without a GUI"
arch=('i686' 'x86_64')
url="http://www.scilab.org/"
provides=('scilab=5.1')
conflicts=('scilab4' 'scilab5' 'scilab')
license=('custom:CeCILL')
depends=('libxml2' 'pcre' 'lapack' 'fftw' 'libmatio' 'tk')
source=("http://www.scilab.org/download/$pkgver/scilab-$pkgver-src.tar.gz")
md5sums=('acc396708aaa7c703288301801714378')
options=('!libtool')

build() {
	cd $srcdir/scilab-$pkgver
	
	./configure --prefix=/usr --disable-build-help \
	  --enable-build-localization --without-pvm \
	  --with-matio --without-umfpack --with-fftw \
      --without-gui --without-javasci \
      --without-ocaml --without-scicos \
	  --with-gfortran  # Needed for 64 bits, don't hurt for 32 bits
	make all doc 
	make DESTDIR=$pkgdir install install-html || return 1
	
	install -d $pkgdir/usr/share/scilab/thirdparty &&
	install -d $pkgdir/usr/share/licenses/$pkgname &&
	install --mode=644 $srcdir/scilab-$pkgver/COPYING \
	  $pkgdir/usr/share/licenses/$pkgname || return 1
	sed -i 's#/jni##' $pkgdir/usr/share/scilab/etc/librarypath.xml
}                                      
