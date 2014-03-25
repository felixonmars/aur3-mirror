# Contributor: quasi <quasi@aur.archlinux.org>
pkgname=gadu-gadu
pkgver=12.0.50.11203
pkgrel=1
pkgdesc="Gadu Gadu Communicator"
arch=('i686' 'x86_64')
url="http://gadu-gadu.pl"
license=('Commercial')
source=(gadu-gadu.desktop)
md5sums=('217098221fd5117f4fa1663fa01acf07')
OPTIONS=(!strip !docs libtool emptydirs zipman !purge !upx)


package(){
  _url='http://im-updates.gg.pl/files/release/linux32'
  [ $CARCH = 'x86_64' ] && _url='http://im-updates.gg.pl/files/release/linux64'

  mkdir -p $pkgdir/opt/ || return 1
  mkdir -p $pkgdir/usr/share/applications || return 1
  cp gadu-gadu.desktop $pkgdir/usr/share/applications || return 1

  cd $startdir/src/
  wget $_url -O gg.tar.bz2 || return 1
  tar jxfv gg.tar.bz2 || return 1


  cp -rf $startdir/src/GG $pkgdir/opt/ || return 1
  chgrp -R users $pkgdir/opt/GG
  chmod -R g+w $pkgdir/opt/GG
}
