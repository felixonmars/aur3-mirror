# Contributor: kutkinnaku <pr0ntier@gmail.com>
pkgname=gidic
pkgver=1.0
pkgrel=1
pkgdesc="a simple offline English-Bahasa Indonesia and Bahasa Indonesia-English dictionary"
arch=(i686 x86_64)
url="http://gidic.sourceforge.net/"
license=('GPL')
depends=('gtk' 'libpng' 'pango' 'cairo')
source=(http://dfn.dl.sourceforge.net/sourceforge/gidic/${pkgname}-${pkgver}.tar.gz gidic_disable_sound.patch)
md5sums=('797f994b89b43d239f6e48ac5fe67de8' '575777361db077fa86ac72b427afff34')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 < ../gidic_disable_sound.patch #disable voice because the author did't provide any sound file!
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 pixmaps/$pkgname-icon48.png $startdir/pkg/usr/share/pixmaps/$pkgname.png
  install -D -m644 $pkgname.desktop $startdir/pkg/usr/share/applications/$pkgname.desktop
}
