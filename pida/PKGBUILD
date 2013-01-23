# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Oliver Sherouse<oliver DOT sherouse AT gmail DOT com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=pida
pkgver=0.6.2
pkgrel=1
pkgdesc="Python Integrated Deelopment Application"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/pida"
license=('GPL')
depends=('bpython2' 'python2-pygtkhelpers-hg' 'python2-logbook' 'vte')
makedepends=('python2-distribute')
optdepends=('gvim:  embedded editor backend'
            'emacs: embedded editor backend'
            'medit: embedded editor backend'
            'anyvc: version control')
source=(http://pypi.python.org/packages/source/p/pida/pida-$pkgver.tar.gz
        pida.desktop)
sha256sums=('f8476c9a36399b525a18761b709c204ae3f3c4344a4334b726d4ddccfca17a34'
            '0ab75154edaf098276059529493cc8f32650df43ca9b41071b2c614d4741564b')

build() {
  cd "$srcdir/pida-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/pida-$pkgver"
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm644 pida/resources/pixmaps/pida-icon.png "$pkgdir/usr/share/pixmaps/pida.png"
  install -Dm644 ../pida.desktop "$pkgdir/usr/share/applications/pida.desktop"
}

# vim:set ts=2 sw=2 et:
