# Maintainer: Nuno Araujo <nuno.araujo at russo79.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=specto
pkgver=0.4.1
pkgrel=2
pkgdesc="A program that will watch configurable events and then trigger notifications"
url="http://specto.sourceforge.net/"
arch=('any')
license=('GPL')
depends=('python2-dbus' 'python2-gconf' 'python2-notify' 'python2-xdg' 'python2-numpy' 'hicolor-icon-theme')
makedepends=('intltool')
optdepends=('bzr: watch Bazaar branches'
            'gstreamer0.10-python: play sound on events' 
            'python2-gnomekeyring: store passwords in GNOME Keyring'
            'python2-simplejson: watch tweets on Twitter'
            'libindicate-gtk2: Messages Indicator support')

install=$pkgname.install
source=(http://specto.googlecode.com/files/$pkgname-$pkgver.tar.gz)

md5sums=('27c69b20eb6f9175937c86fc1d7743c4')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i 's|usr/bin/env python|usr/bin/env python2|' setup.py
  sed -i 's|usr/bin/python|usr/bin/python2|' specto
  python2 setup.py build --prefix=/usr
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver} 
  python2 setup.py install --root=${pkgdir}
}
