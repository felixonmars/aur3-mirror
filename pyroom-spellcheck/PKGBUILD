# Maintainer: Lachlan Main < lachlan _at_ neofish _dot_ org >

pkgname=pyroom-spellcheck
pkgver=0.4.1
pkgrel=2
pkgdesc='Distraction free full-screen text editor with spell checking.'
arch=('any')
url='http://pyroom.org/'
license=('GPL3')
depends=('pygtk' 'python2-xdg' 'python2-gtkspell')
makedepends=('git')
conflicts=('pyroom' 'pyroom-bzr')
optdepends=('python-gconf: for GNOME default fonts support' 'aspell: for spell checking')

build() {
  git clone git://github.com/neofish/pyroom.git && cd pyroom && python2 setup.py build
}

package() {
  cd pyroom &&

  python2 setup.py install --root=${pkgdir} --optimize=1 &&

  # probably needs to get fixed upstream
  install -D -m644 pyroom.1 \
    ${pkgdir}/usr/share/man/man1/pyroom.1
}
