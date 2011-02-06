# Contributor: Charles Gaël DJEDAI <charlesgael.djedai@orange.fr>
pkgname=ade-programme-utils
pkgdesc="Suite d'outils pour la gestion de planning ADE"
pkgver=1.0
pkgrel=1
arch=('any')
url='http://charlesgael.free.fr/'
license=('GPL')
provides=('ade-programme-utils')
depends=('python<2.7' 'python>=2.6')
source=('adeProgrammeUtils.py')

build() {
	cd $srcdir 
	
	# Install the scripts
	install -D -m 755 $srcdir/adeProgrammeUtils.py \
		$pkgdir/usr/lib/python2.6/site-packages/adeProgrammeUtils.py
	
	python -c "import py_compile; py_compile.compile('adeProgrammeUtils.py')" || return 1
	
	install -D -m 755 $srcdir/adeProgrammeUtils.pyc \
		$pkgdir/usr/lib/python2.6/site-packages/adeProgrammeUtils.pyc
}
md5sums=('ee112048d2bd60135bd093a36efb2cc7')
