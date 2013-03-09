# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: rabyte <rabyte*gmail>

pkgname=bluemindo
pkgver=0.3
pkgrel=2
pkgdesc="A simple audio player built on PyGTK and GStreamer"
arch=('any')
url="http://bluemindo.codingteam.net/"
license=('GPL3')
depends=('gstreamer0.10-python' 'pygtk>=2' 'python2-tagpy')
optdepends=('python2-dbus' 'python2-notify' 'python2-pyxmpp')
source=(http://codingteam.net/project/$pkgname/download/file/$pkgname-$pkgver.tar.gz)
sha256sums=('8e382f5978cb9e1927d8a3f3dad1bbde2f5e98d2c49b0641f3a9c3ca40839637')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '1s/python/&2/' src/$pkgname.py
  install -dm755 "$pkgdir"/usr/share/{applications,man/man1,pixmaps}
  make prefix="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
