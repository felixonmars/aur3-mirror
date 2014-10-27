# Author: Jussi Pakkanen
pkgname=glyphtracer
pkgver=1.3
pkgrel=1
epoch=
pkgdesc="A tool for vectorising letters"
arch=('armv7h' 'i686' 'x86_64')
url="https://launchpad.net/glyphtracer"
license=('GPL')
groups=()
depends=('fontforge' 'python-pyqt4' 'potrace')
makedepends=('python')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://launchpadlibrarian.net/58455668/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('080be1c86216a0c0d0e2a10e478dd025')

build() {
cd $srcdir/$pkgname-$pkgver
touch Makefile
echo "PYTHON=python" | tee Makefile
echo "DESTDIR=/" | tee -a Makefile
echo "BUILDIR=\$(CURDIR)/" | tee -a Makefile
echo "PROJECT=numpy" | tee -a Makefile
echo "VERSION=1.7.0" | tee -a Makefile
echo "" | tee -a Makefile
echo "all:" | tee -a Makefile
echo "	@echo \"make source - Create source package\"" | tee -a Makefile
echo "	@echo \"make install - Install on local system\"" | tee -a Makefile
echo "	@echo \"make clean - Get rid of scratch and byte files\"" | tee -a Makefile
echo "" | tee -a Makefile
echo "source:" | tee -a Makefile
echo "	\$(PYTHON) setup.py sdist \$(COMPILE)" | tee -a Makefile
echo "" | tee -a Makefile
echo "install:" | tee -a Makefile
echo "	\$(PYTHON) setup.py install --root \$(DESTDIR) \$(COMPILE)" | tee -a Makefile
echo "" | tee -a Makefile
echo "clean:" | tee -a Makefile
echo "	\$(PYTHON) setup.py clean" | tee -a Makefile
echo "	\$(MAKE) -f \$(CURDIR)/debian/rules clean" | tee -a Makefile
echo "	rm -rf build/ MANIFEST" | tee -a Makefile
echo "	find . -name '*.pyc' -delete" | tee -a Makefile
echo "" | tee -a Makefile
}


package() {
	cd $srcdir/$pkgname-$pkgver
	make
	make source
	make DESTDIR="$pkgdir/" install
	sed -i 's/f = file(fname/f = open(fname/g'  $pkgdir/usr/bin/glyphtracer
	sed -i 's/Exception, e/Exception as e/g'  $pkgdir/usr/bin/glyphtracer
	sed -i 's/xrange/range/g'  $pkgdir/usr/bin/glyphtracer
	sed -i 's/unicode/str/g'  $pkgdir/usr/bin/glyphtracer
	sed -i 's/unichr/chr/g'  $pkgdir/usr/bin/glyphtracer
	sed -i '/app = None/a try:\n    from PyQt4.QtCore import QString\nexcept ImportError:\n    QString = str' $pkgdir/usr/bin/glyphtracer
}

