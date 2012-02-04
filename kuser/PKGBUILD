# Contributor: Pierre Renié <archlinuxien@gmail.com>

pkgname=kuser
pkgver=3.5.9
kdever=3.5.9 # if minor 0, then without .0
pkgrel=1
pkgdesc="KDE Users and groups management."
url="http://www.kde.org"
arch=('i686' 'x86_64')
license=('GPL')
groups=('kde')
depends=('kdelibs>=3.5.8')
conflicts=('kdeadmin')

  mirror="ftp.solnet.ch/mirror/KDE"         # updated every 2 hours, very fast for Europe
# mirror="ftp.kde.org/pub/kde/"             # main server
# mirror="ibiblio.org/pub/mirrors/kde/"     # ibiblio mirror

source=(ftp://$mirror/stable/$kdever/src/kdeadmin-$pkgver.tar.bz2)


build() {
  # start building
  cd $startdir/src/kdeadmin-$pkgver
  ./configure --prefix=/opt/kde \
  --with-shadow --without-rpm --disable-debug --disable-dependency-tracking
  
  cd kuser || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('e6607ea27b332616d20f4564656cb885')
