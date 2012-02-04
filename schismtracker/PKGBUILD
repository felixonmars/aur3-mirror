# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Jacek Poplawski <jacekpoplawski@gmail.com> 

pkgname=schismtracker
pkgver=20120105
pkgrel=1
pkgdesc="A free reimplementation of Impulse Tracker"
arch=('i686' 'x86_64')
url="http://rigelseven.com/schism/"
license=('GPL')
depends=('libxv' 'sdl' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('mesa')
install="$pkgname.install"
source=("http://schismtracker.org/dl/$pkgname-$pkgver.tar.bz2")
md5sums=('c85ee0750b2890cbd123ff6f9cb827b9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # icons
  for i in 16 22 24 32 36 48 64 72 96 128 192; do
    install -Dm644 icons/schism-icon-${i}.png \
      ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png
    install -Dm644 icons/schism-itf-icon-${i}.png \
      ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname-itf.png
  done;
  install -Dm644 icons/schism-icon.svg \
    ${pkgdir}/usr/share/icons/hicolor/scalable/$pkgname.svg
  install -Dm644 icons/schism-itf-icon.svg \
    ${pkgdir}/usr/share/icons/hicolor/scalable/$pkgname-itf.svg

  # docs
  install -d ${pkgdir}/usr/share/doc/$pkgname
  install -Dm644 helptext/* ${pkgdir}/usr/share/doc/$pkgname

  # desktop files
  sed -i "s|\(schism\)\(-itf\)*.*128|\1tracker\2|" sys/fd.org/*.desktop
  install -Dm644 sys/fd.org/schism.desktop \
    ${pkgdir}/usr/share/applications/$pkgname.desktop
  install -Dm644 sys/fd.org/itf.desktop \
    ${pkgdir}/usr/share/applications/$pkgname-itf.desktop
}
