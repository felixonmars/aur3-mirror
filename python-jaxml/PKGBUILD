# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>

pkgname=python-jaxml
pkgver=3.01
pkgrel=1
pkgdesc="JAXML is a Python module which makes the automated generation of XML, XHTML or HTML documents easy."
url="http://www.librelogiciel.com/software/jaxml/action_Presentation"
depends=('python' 'setuptools')
source=(http://www.librelogiciel.com/software/jaxml/tarballs/jaxml-$pkgver.tar.gz)
md5sums=('87687c2bb5bceca0f93c53cd600ed9f1')

build() {
	cd $startdir/src/jaxml-$pkgver
	python setup.py install --root=$startdir/pkg || return 1
} 
