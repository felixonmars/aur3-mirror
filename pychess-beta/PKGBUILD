pkgname=pychess-beta
pkgver=0.12beta4
pkgrel=1
pkgdesc="Chess client for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://pychess.org/"
license=('GPL3')
depends=('gstreamer0.10-python' 'gnome-icon-theme' 'pygtksourceview2'
         'python2-pysqlite' 'python2-rsvg')
optdepends=('gstreamer0.10-base-plugins: sound support')
conflicts=('pychess' 'pychess-hg')
provides=('pychess')
install=$pkgname.install
source=(http://pychess.googlecode.com/files/pychess-$pkgver.tar.gz)
sha1sums=('8ff31e252873b5f658409776ff94b63f5d2f07be')

package() {
  cd "$srcdir/pychess-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
