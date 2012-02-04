# Old Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=kdedecor-humanblue
pkgver=0.3
pkgrel=1
pkgdesc="KDE window decoration based on the Ubuntu Human theme"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=48318"
license=('GPL')
depends=('kdebase')
source=(http://download.tuxfamily.org/nferko/kde/deco/humanblue-$pkgver.tar.bz2)
md5sums=('282583dcb35e5f7c21624f2d3fe91d9c')

build() {
  cd ${startdir}/src/humanblue-${pkgver}/

  # Source the KDE and QT profiles
  [ -f /etc/profile.d/kde.sh ] && source /etc/profile.d/kde.sh
  [ -f /etc/profile.d/qt.sh ] && source /etc/profile.d/qt.sh

  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
