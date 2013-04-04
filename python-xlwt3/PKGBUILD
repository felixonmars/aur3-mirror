# Contributor: zhangjoto <zhangjoto@gmail.com>

pkgname=python-xlwt3
pkgver=0.1.2
pkgrel=1
pkgdesc="Library to create spreadsheet files compatible with MS Excel 97/2000/XP/2003 XLS files"
url="https://bitbucket.org/mozman/xlrd3/overview"
depends=('python')
source=("https://pypi.python.org/packages/source/x/xlwt3/xlwt3-0.1.2.tar.gz#md5=8ef22d0567b3f20663d2a5e605b019c6"
		"formula.patch"
		)
arch=('any')
license=('BSD')
md5sums=('8ef22d0567b3f20663d2a5e605b019c6'
         'cb585e201116387adf9edca8d1ffbb61')

build() {

	cd $startdir/src/
	msg "aplly patch"
	patch -p1 < formula.patch

	cd $startdir/src/xlwt3-$pkgver
	python setup.py install --root=$pkgdir
}
