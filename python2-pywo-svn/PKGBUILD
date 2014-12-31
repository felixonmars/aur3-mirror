# Maintainer: Javier Santacruz <javier.santacruz.lc@gmail.com>
pkgname=python2-pywo-svn
pkgver=0.3.0.202
pkgrel=1
pkgdesc="library to easily organize windows on the desktop using keyboard shortcuts (development version)"
arch=('any')
url="https://code.google.com/p/pywo/"
license=('GPL3')
depends=('python2' 'python2-xlib')
makedepends=('subversion' 
             'python2-setuptools')
provides=('python2-pywo')
conflicts=('python2-pywo')
source=('pywo::svn+http://pywo.googlecode.com/svn/trunk/'
        'pywo.service')
md5sums=('SKIP'
         'd2fd63eee5cbce4ff7cbad7fc7e29acd')

pkgver() {
	cd "$srcdir/pywo"
	echo "$(python2 setup.py --version)"."$(svn info | grep Revision | cut -d " " -f 2)"
}

build () {
	cd "$srcdir/pywo"
	python2 setup.py build
}

check () {
    cd "$srcdir/pywo"
	python2 setup.py test
}

package() {
	cd "$srcdir/pywo"
	python2 setup.py install --root "$pkgdir/" --optimize=1

	cd "$srcdir"
	install -d $pkgdir/usr/share/pywo
	install -m755 pywo.service $pkgdir/usr/share/pywo

	warning "Install pywo service with:"
	plain "cp /usr/share/pywo/pywo.service ~/.config/systemd/user"
	plain "systemd --user enable pywo"
}
