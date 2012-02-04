# Maintainer: sHyLoCk <pdg@archlinux.us>

pkgname=nostromo-icon-theme
pkgver=1.03
pkgrel=1
pkgdesc="Nostromo Pack Icon Theme used for ArchBang."
arch=('any')
license=('GPL')
depends=('gtk2')
url="http://gnome-look.org/content/show.php/Nostromo?content=101422"
source=(http://cine9.free.fr/icones/Nostromo-1.03.tar.gz)

build() {
  cd ${startdir}/src/
  mkdir -p $pkgdir/usr/share/icons/
  tar -xf Nostromo-$pkgver.tar.gz -C $pkgdir/usr/share/icons
}
md5sums=('5eb264beb8b988902c6d2de2afe8cf0b')
