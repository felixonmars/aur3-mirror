# Contributor: fancris3 <fancris3 at aol.com>
pkgname=kdedecor-metal4kde
pkgver=0.2
pkgrel=1
pkgdesc="metalic look for kde, based on phase liquid and baghira.kwin decor + kdestyle"
arch=(i686 x86_64)
url="http://www.kde-look.org/content/show.php/Metal4kde?content=17463"
license=('GPL')
depends=('kdebase')
makedepends=('automake' 'rpmextract')
#home page don,t work
source=(http://ftp.gwdg.de/pub/linux/misc/suser-guru/rpm/packages/\
Themes-KDE3/metal4kde/src/metal4kde-0.2-1.guru.suse93.kde34.src.rpm)
md5sums=('c1878a679f369d15965983d6ca42c89d' )

build() {
  rpmextract.sh metal4kde-0.2-1.guru.suse93.kde34.src.rpm
  tar -xf Metal4kde-${pkgver}.tar.gz
  cd Metal4kde-${pkgver}
  ./configure --prefix=/opt/kde --with-qt-dir=/opt/qt
  make || return 1
  make DESTDIR=$startdir/pkg install
}
