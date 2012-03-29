# Contributor: Blaž Tomažič <blaz.tomazic@gmail.com>
pkgname=periscope
pkgver=0.2.4
pkgrel=2
pkgdesc="Python module searching subtitles on the web."
url="http://code.google.com/p/periscope/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('python-beautifulsoup' 'python2' 'unrar')
makedepends=('setuptools')
conflicts=('periscope-svn')
source=("http://periscope.googlecode.com/files/python-${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('49df780245103697579551410a9acc49')

build() {
	cd ${srcdir}
	
	python2 ./setup.py build || return 1
}

package(){
	cd ${srcdir}

	python2 ./setup.py install --root=$pkgdir || return 1
}
