# Maintainer: Stefan Kirrmann <stefan.kirrmann at gmail dot com>

pkgname=vboxgtk
pkgver=0.8.2
pkgrel=1
pkgdesc="A simple GTK frontend for VirtualBox OSE."
arch=(any)
url="http://code.google.com/p/vboxgtk/"
license=('GPL3')
depends=('pygtk>=2.24' 'virtualbox-sdk>=4.1.2' 'gtk3' 'python2-gobject>=2.28.6')
makedepends=('intltool')
options=(!emptydirs)
source=(http://vboxgtk.googlecode.com/files/vboxgtk-$pkgver.tar.gz)
install=vboxgtk.install
md5sums=('97dd735b9a466b6810979b4579d8efef')

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/
}
