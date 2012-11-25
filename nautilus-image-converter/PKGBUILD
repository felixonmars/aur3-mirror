# Contributor: pressh <pressh at gmail dot com>
# Contributor: William Rea <sillywilly@gmail.com>
# Maintainer: Filip Djordjevic <fdjordjevic@tuxtard.com>

pkgname=nautilus-image-converter
pkgver=0.3.1
pkgrel=1
pkgdesc="Nautilus extension to mass resize images"
url="http://www.bitron.ch/software/nautilus-image-converter.php"
license=('GPL')
depends=('gtk3' 'nautilus' 'imagemagick')
makedepends=('intltool')
source=('http://pkgs.fedoraproject.org/repo/pkgs/nautilus-image-converter/nautilus-image-converter-0.3.1.tar.bz2/09f765f9a5f0ea33c7fb14487b6ea61b/nautilus-image-converter-0.3.1.tar.bz2')
options=('!libtool')
arch=('i686' 'x86_64')
md5sums=('09f765f9a5f0ea33c7fb14487b6ea61b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
