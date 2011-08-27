# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=kldraw
pkgver=0.1.0
pkgrel=4
pkgdesc="3D LEGO modeling software for KDE"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php?content=47371"
license=('GPL')
depends=('ldraw-parts-library' 'libgl' 'kdelibs' 'sqlite3')
install=kldraw.install
source=(http://www.kde-apps.org/CONTENT/content-files/47371-${pkgname}-${pkgver}.tar.gz \
        automake_1.10.patch)
md5sums=('f9add5695bdb3e55bad31815d85f0a6b'
         '040cb98d0803f0c3ee3878f09cb76cdc')

build() {
  cd ${startdir}/src/kldraw.kdevelop/

  patch -Np1 -i ../automake_1.10.patch || return 1

  # Source the KDE and QT profiles
  source /etc/profile.d/kde.sh
  source /etc/profile.d/qt.sh

  make -f admin/Makefile.common
  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install
}

# vim:set ts=2 sw=2 et:
