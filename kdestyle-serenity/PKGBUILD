#Contributor: pressh <pressh <at> gmail <dot> com>

pkgname=kdestyle-serenity
pkgver=1.7.1
pkgrel=3
pkgdesc="A soft and quiet KDE theme to ease your mind"
url="http://www.kde-look.org/content/show.php?content=35954"
license=('GPL')
depends=('kdebase')
source=(http://maxilys.ifastnet.com/archives/serenity-$pkgver.tar.bz2)
arch=('i686' 'x86_64')
md5sums=('fc6ad200a3956d22afa6274cbe2d1f37')

build() {
  # Source the QT and KDE profile
  [ -z "${QTDIR}" ] && . /etc/profile.d/qt3.sh
  [ -z "${KDEDIR}" ] && . /etc/profile.d/kde.sh
  # start building
  cd $startdir/src/serenity-$pkgver
  ./configure --disable-debug --enable-final --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

