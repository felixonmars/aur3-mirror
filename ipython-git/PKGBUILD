# Maintainer: Joschka Thurner <mail@joschkathurner.de>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor : Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=ipython-git
_gitname="ipython"
pkgver=17839.59f77d0
pkgrel=1
pkgdesc="An enhanced Interactive Python 3 shell in its current version from github."
arch=('any')
url="http://ipython.org"
license=('Modified BSD')
makedepends=('python-setuptools' 'sqlite' 'git')
depends=('python' 'sqlite' 'python-setuptools')
optdepends=("python-nose: if you want to run IPython's test suite"
            "python-pyqt4: for ipython qtconsole"
            "python-sip: for ipython qtconsole"
            "python-pygments: for ipython qtconsole"
            "python-pyzmq: for ipython notebook and ipython qtconcole"
            "python-tornado: for ipython notebook"
            "python-jinja: for ipython notebook"
	    "python-jsonschema: for ipython notebook"
	    "python-jsonpointer: for ipython notebook"
            "haskell-pandoc: ipython notebook conversion")
provides=('ipython3' 'ipython')
conflicts=('ipython3' 'ipython')
source=("git://github.com/ipython/ipython.git"
	"git://github.com/ipython/ipython-components.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $_gitname
  git submodule init
  git config submodule.components.url "$srcdir/ipython-components"
  git submodule update
}


package() {
  cd $srcdir/$_gitname
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
  find "$pkgdir/" -name '*.pyc' -delete
  find "$pkgdir/" -type d -empty -delete

  install -Dm644 docs/source/about/license_and_copyright.rst "$pkgdir/usr/share/licenses/ipython/LICENSE"

  cd "$srcdir/$_gitname/examples/IPython Kernel/"
  install -Dm644 ipython.desktop "$pkgdir/usr/share/applications/ipython.desktop"
  install -Dm644 ipython-qtconsole.desktop "$pkgdir/usr/share/applications/ipython-qtconsole.desktop"
}

