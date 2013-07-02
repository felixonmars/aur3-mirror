pkgname=runewin-bzr
pkgver=111
pkgrel=1
pkgdesc="An open source client for Runescape"
arch=('any')
url="http://runewin.wikidot.com/"
license=('GPL3')
depends=('python2-configobj' 'pygtk' 'gnome-python-extras' 'pywebkitgtk' 'python2')
makedepends=('bzr')
source=('bzr+lp:runewin')
md5sums=('SKIP')

_bzrmod=runewin

pkgver() {
		  cd "$_bzrmod"
		    bzr revno
	}

package() {
  cd "${srcdir}/${_bzrmod}"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

