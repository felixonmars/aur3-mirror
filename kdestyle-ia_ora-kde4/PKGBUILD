#Contributor: Thomas Lundgaard <thomaslundgaard at gmail dot com>

pkgname=kdestyle-ia_ora-kde4
pkgver=0.2.2.1
pkgrel=1
pkgdesc="Default Mandriva Theme for KDE4"
url="http://www.mandriva.com/"
license="GPLv3"
depends=()
makedepends=('rpmextract' 'cmake')
conflicts=('skulpture')
install=
source=(http://fr.rpmfind.net/linux/Mandrake-devel/cooker/SRPMS/main/release/kde4-style-iaora-${pkgver}-1mdv2010.0.src.rpm)
md5sums=('2a5ed728eaa7f5fbe12cd61f6ca10083')
arch=('i686' 'x86_64')

build() {
  cd $startdir/src/
  rpmextract.sh kde4-style-iaora-${pkgver}-1mdv2010.0.src.rpm
  tar -jxvf ia_ora-kde4-${pkgver}.tar.bz2
  patch -p0 < kde4-style-iaora-nodebug.patch
  cd ia_ora-kde4

  cmake -DCMAKE_INSTALL_PREFIX="$startdir/pkg/usr" \
   -DQT_PLUGINS_DIR="$startdir/pkg/usr/lib/qt/plugins/" \
   -DCMAKE_BUILD_TYPE=Release .
  make || return 1
  make install 
}
