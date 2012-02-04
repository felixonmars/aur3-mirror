# Contributor: Marcel Schneider <marcelATcoopmastersDOTde>
pkgname=neelix
_pkgname=Neelix
pkgver=0.9.6.1b2
pkgrel=3
arch=('i686')
license=""
pkgdesc="A campaign creator for RTCW Enemy Territory"
url="http://gaminggone.net"
depends=(jre)

source=(http://gaminggone.net/creator/Neelix.zip neelix Neelix.desktop)
md5sums=('3d7cfcf0fb8b6ef5c488051409764374'
         '8175907f691c16f49d579b34b56cfbe5'
         '785ab6773bcdeaf1ce57026a21036a59')
build() {
  cd $startdir/src/$_pkgname
  mkdir -p $startdir/pkg/usr/share/java
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/applications
  install -m 644 $startdir/src/$_pkgname/$pkgname.jar $startdir/pkg/usr/share/java
  install -m 755 $startdir/src/$pkgname $startdir/pkg/usr/bin
  install -m 655 $startdir/src/$_pkgname.desktop $startdir/pkg/usr/share/applications
  #find $startdir/pkg -name '*.la' -exec rm {} \;
}
