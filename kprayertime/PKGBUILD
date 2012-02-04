# Contributor: Elyess ZOUAGHI <zouaghi.elyess@gmail.com>
pkgname=kprayertime
pkgver=0.9.9.5
pkgrel=1
pkgdesc="A KDE applet that displays the Islamic prayer times for the day"
arch=(i686)
url="http://kprayertime.sourceforge.net/"
license=('GPL')
depends=(kdelibs)
makedepends=(libtool)
source=(http://superb-west.dl.sourceforge.net/sourceforge/kprayertime/$pkgname-$pkgver.tar.gz)
md5sums=('05e20d4c350a7f369c65d43c779765b5')

build() {
  cd "$startdir/src/$pkgname"

  ./configure --prefix=/opt/kde
  make || return 1
  mkdir -v -p "$startdir/pkg/opt/kde/share/icons/hicolor/48x48/apps/"
  make prefix="$startdir/pkg/opt/kde" install
}

# vim:set ts=2 sw=2 et:
