# Contributor: Jan Blazek <appolito@gmail.com>

pkgname=kdedecor-alphacube
pkgver=0.3
pkgrel=3
pkgdesc="KDE Window Decoration ported from the Metacity theme Alphacube"
url="http://www.kde-look.org/content/show.php?content=32099"
license="GPL"
arch=('i686')
depends=('kdebase')
source=(http://www.kde-look.org/CONTENT/content-files/32099-Alphacube-$pkgver.tar.bz2)
md5sums=('e5213ead2810f8b9f7cfde80f11035fa')

build() {
  cd $startdir/src/Alphacube-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
  mkdir -p ${startdir}/pkg/opt/kde/share/apps/kdisplay/color-schemes
  install -m644 ${startdir}/src/Alphacube-$pkgver/Alphacube.kcsrc \
    ${startdir}/pkg/opt/kde/share/apps/kdisplay/color-schemes/
}
