# Contributor: Joker-jar <joker-jar@yandex.ru>
# Maintainer: Alois Nespor <info@aloisnespor.info>
pkgname=kdeartwork-androbit
pkgver=4.11
pkgrel=1
pkgdesc="A modern theme for KDE4 plasma desktop"
arch=('any')
url="http://kde-look.org/content/show.php/Androbit+(KDE+4.6+compatibility)?content=123524"
license=('GPL')
depends=('kdebase-workspace')
source=("https://downloads.sourceforge.net/project/androbit/androbit-$pkgver.tar.gz")
install="$pkgname.install"

build() {
  cd ${srcdir}
  rm *.tar.gz
\
}

package() {
  mkdir -p ${pkgdir}/usr/share/apps/desktoptheme/androbit
  cp -rp $srcdir/androbit/* ${pkgdir}/usr/share/apps/desktoptheme/androbit

}
sha256sums=('f243c000a7514f4cff0a261b25b0aee224268544412d4e8078b1bcc195c6f81b')
