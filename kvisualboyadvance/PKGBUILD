# Contributor: Darwin Bautista <djclue917@gmail.com>
# Maintainer: TheBenj <thebenj88 *AT* gmail *DOT* com>

pkgname=kvisualboyadvance
pkgver=0.3.1
pkgrel=3
pkgdesc="Graphical front-end to VisualBoyAdvance"
arch=(i686 x86_64)
url="http://www.kde-apps.org/content/show.php?content=10210"
license=('GPL')
depends=('kdelibs3' 'visualboyadvance')
source=(ftp://ftp.mirrorservice.org/sites/www.ibiblio.org/gentoo/distfiles/${pkgname}-${pkgver}.tar.gz)
md5sums=('72e4e44ad17d349ae0fde9db0c90a112')

build() {
  cd $srcdir/${pkgname}-${pkgver}/

  # Source the KDE and QT profiles
  [ -f /etc/profile.d/kde.sh ] && source /etc/profile.d/kde.sh
  [ -f /etc/profile.d/qt.sh ] && source /etc/profile.d/qt.sh

  ./configure --prefix=/opt/kde --disable-debug --without-arts
  make || return 1
  make DESTDIR=$pkgdir/ install
  
  # Move executable to /usr/bin
  install -d $pkgdir/usr/bin
  mv -v $pkgdir/opt/kde/bin/$pkgname $pkgdir/usr/bin/$pkgname
}
