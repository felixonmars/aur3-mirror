# Maintainer: Cesar Ramone <cesar@ovejo.com>
pkgname=python-timer
_pkgname=timer
pkgver=0.1
pkgrel=1
pkgdesc="High frequency start/stop timer."
url="http://pypi.python.org/pypi/timer/0.1"
arch=('i686' 'x86_64')
license=('PSF')
depends=('python2' 'python')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://pypi.python.org/packages/source/t/timer/$_pkgname-$pkgver.zip)
md5sums=('097b5dcaaecfd1388c871233a0c31196')

build() {
	  cd $startdir/src/$_pkgname-$pkgver
	  touch description.txt
	    python2 setup.py build || return 1
		python2 setup.py install --prefix=/usr --root=$startdir/pkg || return 1
        
		python setup.py build || return 1
		python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
         
}
