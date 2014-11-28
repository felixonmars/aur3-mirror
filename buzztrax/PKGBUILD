# Maintainer: speps <speps at aur dot archlinux dot org>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=buzztrax
pkgver=0.8.0
pkgrel=1
pkgdesc="A modular, free, open source music studio that is conceptually based on Buzz (former Buzztard)"
arch=('i686' 'x86_64')
url="http://www.buzztrax.org"
license=('LGPL')
depends=("gst-buzztrax>=$pkgver" 'clutter-gtk' 'libgsf' 'desktop-file-utils')
makedepends=('intltool' 'gtk-doc')
provides=("buzztard=$pkgver")
conflicts=('buzztard')
replaces=('buzztard')
install="$pkgname.install"
source=("http://files.buzztrax.org/releases/$pkgname-$pkgver.tar.gz")
md5sums=("a64156f0e5546fde0ce17899f48894cd")

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --enable-static=no \
              --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install

  # Deleting unneeded files
  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
  find "$pkgdir/usr/share/mime" -maxdepth 1 -type f -exec rm {} \;
}
