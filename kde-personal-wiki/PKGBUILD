# Contributor: Chris O'Reilly <pbw@massinfluence.net>

pkgname=kde-personal-wiki
pkgver=0.0.1
pkgrel=1
pkgdesc="This is a Wiki engine for KDE, made for only personal use. Consider it a replacemente of KNotes and such apps."
url="http://kde-apps.org/content/show.php?content=41657"
license="gpl"
depends=('kdelibs')
makedepends=('scons')
source=(http://hunts.kde.cl/software/$pkgname-$pkgver.tar.bz2)

build() {
  cd $startdir/src/$pkgname
  scons PREFIX=/opt/kde || return 1
  scons DESTDIR=$startdir/pkg install
}
md5sums=('138fb8f8cdf4cc9d5db63366c681fb55')
