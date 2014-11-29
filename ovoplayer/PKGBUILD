# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=ovoplayer
pkgver=1.0
pkgrel=1
pkgdesc="Multiplatform audio player written in Lazarus/FreePascal."
arch=('i686' 'x86_64')
url="http://ovoplayer.altervista.org/"
license=('GPL2')
depends=('dbus-glib' 'desktop-file-utils' 'gtk2')
makedepends=('lazarus')
install=$pkgname.install
source=(http://dl.bintray.com/varianus/generic/$pkgname-$pkgver-src.zip)
md5sums=('92e8846c18dd1cba925741470ceefb3c')

build() {
  cd $srcdir/$pkgname-$pkgver

  # Widgetset
  _ws=gtk2

  lazbuild {src/$pkgname,tools/${pkgname}ctrl/${pkgname}ctrl}.lpi --lazarusdir=/usr/lib/lazarus \
  --widgetset=$_ws --primary-config-path=$srcdir/config --build-mode=Release
}

package() {
  cd $srcdir/$pkgname-$pkgver

  # Executable
  install -Dm755 bin/linux/$pkgname $pkgdir/usr/bin/$pkgname

  # Command line controller for OvoPlayer
  install -Dm755 bin/linux/${pkgname}ctrl $pkgdir/usr/bin/${pkgname}ctrl

  # Images
  mkdir -p $pkgdir/usr/share/ovoplayer
  cp images/{logo,nocover,volume-slider*}.png $pkgdir/usr/share/$pkgname
  chmod -R 644 $pkgdir/usr/share/$pkgname

  # Desktop icon
  install -Dm644 packages/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 images/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png

  # Italian language
  install -Dm644 language/$pkgname.it.po $pkgdir/usr/share/locale/it/$pkgname.it.po
  install -Dm644 language/$pkgname.po $pkgdir/usr/share/locale/it/LC_MESSAGES/$pkgname.po

  # Man pages
  install -Dm644 DOC/manpages/$pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1.gz
  install -Dm644 DOC/manpages/${pkgname}ctrl.1 $pkgdir/usr/share/man/man1/${pkgname}ctrl.1.gz
}