# Maintainer: Joschka Thurner <mail@joschkathurner.de>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor : Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=ipython2-git
_gitname="ipython"
pkgver=17839.59f77d0
pkgrel=1
pkgdesc="An enhanced Interactive Python 2 shell in its current version from github."
arch=('any')
url="http://ipython.org"
license=('Modified BSD')
makedepends=('python2-setuptools' 'sqlite' 'git')
depends=('python2' 'sqlite' 'python2-setuptools')
optdepends=("python2-nose: if you want to run IPython's test suite"
            "python2-pyqt: for ipython qtconsole"
            "python2-sip: for ipython qtconsole"
            "python2-pygments: for ipython qtconsole"
            "python2-pyzmq: for ipython qtconsole / parallel computing"
            "python2-tornado: for ipython notebook"
            "python2-jinja: for ipython notebook"
	    "python2-jsonschema: for ipython notebook"
	    "python2-jsonpointer: for ipython notebook"
            "haskell-pandoc: ipython notebook conversion")              
provides=('ipython2')
conflicts=('ipython2')
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
  cd "$srcdir/$_gitname"

  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
  rm -rf "$pkgdir/usr/share/doc"
  find "$pkgdir" -name '*.py' -print0 | xargs -0 \
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
    -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'
  find "$pkgdir/" -name '*.pyc' -delete

  install -Dm644 docs/source/about/license_and_copyright.rst "$pkgdir/usr/share/licenses/ipython2/LICENSE"

  # hack to get around ipython collision
  cd "$pkgdir/usr/share/man/man1/"
  for i in *; do
    mv $i ${i/%.1/2.1}
  done
  find "$pkgdir/usr/bin/" -type f -regex '.*[^2]$' -delete

  cd "$srcdir/$_gitname/examples/IPython Kernel/"
  sed -i 's/ython/ython2/g' *.desktop
  install -Dm644 ipython.desktop "$pkgdir/usr/share/applications/ipython2.desktop"
  install -Dm644 ipython-qtconsole.desktop "$pkgdir/usr/share/applications/ipython2-qtconsole.desktop"
}
