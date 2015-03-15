# Contributor: sickhate <sickhate@tux-linux.net>

pkgname=devidify
pkgver=1.14
pkgrel=2
pkgdesc="humble little hack for extracting audio tracks from DVDs"
arch=('i686' 'x86_64')
url="http://www.mahnamahna.net/museyroom/devidify/devidify.shtml"
license=('GPL')
depends=('pygtk' 'mplayer' 'lsdvd' 'lame' 'vorbis-tools')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz devidify.desktop)
md5sums=('a63b71b4f6f2c27f1ba79ac3685b48ad'
         'b34ead05889576c84983c79b32cd8c85')


prepare() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's|local/||' setup.cfg
}

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
  install -Dm644 ../devidify.desktop $pkgdir/usr/share/applications/devidify.desktop

  # No need to install these files
  rm $pkgdir/usr/share/$pkgname/{COPYING,NEWS,README,TODO}
}
