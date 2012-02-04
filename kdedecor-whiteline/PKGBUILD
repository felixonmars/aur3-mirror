# Contributor: stanger <svoboda.pavel@gmail.com>

pkgname="kdedecor-whiteline"
pkgver=0.1
pkgrel=1
pkgdesc="a KDE window decoration"
url="http://www.kde-look.org/content/show.php/Whiteline+for+KWin?content=66962"
license="GPL"
depends=('kdebase' 'kdelibs')
arch=('i686')
makedepends=()
source=('http://works13.com/downloads/WhitelineKwin.tar.gz')
md5sums=('763f58dc98530469c2f0fcf733c50d93')

build() {
  cd $startdir/src/WhitelineKwin-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
