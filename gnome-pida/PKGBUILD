# Maintainer: Hilton Medeiros <medeiros.hilton at gmail dot com>
# Contributor: Hylix <hylixx@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=gnome-pida
_pkgname=pida
pkgver=0.6.2
pkgrel=3
pkgdesc="A flexible IDE for any programming language, specially python (Gnome)"
arch=('any')
url="http://pida.co.uk"
license=('GPL')
depends=('gnome-python' 'dbus-python' 'python-simplejson' 'python-pygtkhelpers' 'bpython' 'vte')
makedepends=('python2-distribute')
optdepends=('gvim: to use as an embedded editor'
            'emacs: to use as an embedded editor'
            'anyvc: for version control')
conflicts=(pida)
provides=(pida=0.6.2)
source=(http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz 
        pida.desktop)
md5sums=('6ee61497996abd54f8a9dacd39b90c8c'
         '0216466cf5f64238c90b5e07df71ce3a')

build() {
  /bin/true
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1

  install -Dm644 COPYING $pkgdir/usr/share/licenses/pida/LICENSE
  
  install -Dm644 pida/resources/pixmaps/pida-icon.png $pkgdir/usr/share/pixmaps/pida.png
  install -Dm644 $srcdir/pida.desktop $pkgdir/usr/share/applications/pida.desktop  
}
