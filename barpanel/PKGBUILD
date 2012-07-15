# Contributor: Alois Nespor <alois.nespor@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: J. W. Birdsong  <jwbirdsong AT gmail DOT com>

pkgname=barpanel
pkgver=0.6.0
pkgrel=4
pkgdesc="Desktop panel, extensible through plugins, themeable and desktop indepedent."
url="http://www.igelle.org/barpanel"
license=('GPL2')
depends=('gtk2' 'pygtk' 'pyxdg' 'python2-dbus' 'python-wnck')
optdepends=('stalonetray: if you want a tray')
arch=('any')
source=(http://www7.frugalware.org/pub/frugalware/frugalware-current/source/x11-extra/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1a27d1a46d60e34cd8bb810a5e72693f')
install=barpanel.install

package() {
  cd $srcdir/$pkgname-$pkgver
   export PTHYON=python2
   python2 setup.py install --prefix="$pkgdir/usr/" || return 1
}

