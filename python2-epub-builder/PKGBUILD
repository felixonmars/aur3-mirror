# Contributor: Mark Harviston infinull@gmail.com
pkgname=python2-epub-builder
pkgver=20101216
pkgrel=2
pkgdesc="Python API for building EPUB Books"
arch=('any')
url="https://code.google.com/p/python-epub-builder/"
license=('GPL')
depends=('python2' 'python2-genshi' 'python2-lxml')
source=("http://python-epub-builder.googlecode.com/files/python-epub-builder-$pkgver.zip")

build() {
	cd "python-epub-builder"
	echo \
"from distutils.core import setup
from glob import glob
setup(name='$pkgname',
	description='$pkgdesc',
	version='$pkgver',
	py_modules=['epub','ez_epub'],
	data_files=[('templates',glob('templates/*'))],
)" > setup.py
	python2 setup.py build
	python2 setup.py install --root=$pkgdir
}

md5sums=('1ae2908ef2450bbaccc736091f6fce85')
