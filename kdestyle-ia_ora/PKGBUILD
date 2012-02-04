#Contributor: imrahil <hugo_alobo@hotmail.com>

pkgname=kdestyle-ia_ora
pkgver=1.0.8
pkgrel=2
pkgdesc="Default Mandriva Theme for KDE 3 (includes style and window decoration)"
url="http://www.mandriva.com/"
license="GPL"
depends=('qt3')
makedepends=('rpmextract')
install=
source=(http://fr.rpmfind.net/linux/Mandrake-devel/cooker/SRPMS/main/release/ia_ora-kde-${pkgver}-4mdv2009.0.src.rpm)
md5sums=('9c542304fd07da1fc03ad0778d459fe7')
arch=('i686' 'x86_64')

build() {
  cd $startdir/src/
  rpmextract.sh ia_ora-kde-${pkgver}-4mdv2009.0.src.rpm
  tar -jxvf ia_ora-kde-$pkgver.tar.bz2
  cd ia_ora-kde-${pkgver}
  ./configure --prefix=/opt/kde --with-xinerama
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
}
