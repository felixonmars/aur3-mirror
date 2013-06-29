# Maintainer: Cedric Leporcq <cedl38 at gmail dot com>

pkgname=zenx-gtk-themes
pkgver=0.11.5
pkgrel=1
pkgdesc="A variant of 'zen-gtk-themes' with the xfce engine."
arch=('any')
url="http://xfce-look.org/content/show.php/Zen+suite?content=149883"
license=('GPL3')
depends=('gtk-engines' 'gtk2-xfce-engine')
optdepends=('alinea-themes' 'mini-xfwm4-theme' 'xfce4-notifyd' 'gtk3-xfce-engine' 'libreoffice-patch.sh: script to increase sheet tabs for LibreOffice. See README.md or http://xfce-look.org/content/show.php/Zen+suite?content=149883 for more infos')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cedl38/zen-gtk-themes/archive/xv$pkgver.tar.gz")
sha256sums=('76e815d95be2d208074826c617d40c8beb92247eb04568f17b829a7e294d4a92')

build() {
  cd $srcdir/zen-gtk-themes-xv$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/zen-gtk-themes-xv$pkgver
  make DESTDIR="${pkgdir}" install
}
