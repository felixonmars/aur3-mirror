# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=kdestyle-baghira
pkgver=0.8
pkgrel=3
pkgdesc="KDE 3.5.x Window Decoration and Style (like Mac OS X)"
url="http://www.kde-look.org/content/show.php?content=8692"
license=('BSD')
arch=('i686' 'x86_64')
depends=('kdelibs3')
makedepends=('kdebase-workspace')
source=(http://downloads.sourceforge.net/baghira/baghira-$pkgver.tar.bz2)
md5sums=('d76e04020c628ba5de69d066a66221f8')

build() {
  cd "$srcdir/baghira-$pkgver"

  . /etc/profile.d/kde3.sh
  . /etc/profile.d/qt3.sh
  export PATH=$QTDIR/bin:$PATH
  
  ./configure --disable-debug \
    --enable-final \
    --prefix=/opt/kde \
    --without-arts
  make || return 1
  make DESTDIR="$pkgdir" install
}
