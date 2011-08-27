# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=xarchon
pkgver=0.50
pkgrel=4
pkgdesc="a clone of the classic ARCHON game."
arch=(i686 x86_64)
url="http://xarchon.seul.org"
license=('GPL')
depends=('gtk')
source=(http://xarchon.seul.org/${pkgname}-${pkgver}.tar.gz http://ftp.de.debian.org/debian/pool/main/x/xarchon/${pkgname}_${pkgver}-10.2.diff.gz)
md5sums=('491dea5b4e61ed13cd988d1c184a8ef0 e716ee1df581a6c9d540c99127f24ca1')


build() {
  cd $srcdir
  mv ${pkgname}-${pkgver} ${pkgname}-${pkgver}.orig 
  patch -p0 <xarchon_0.50-10.2.diff
  cd $srcdir/${pkgname}-${pkgver}.orig
  ./configure --prefix=/usr
# if you use the http://ftp.de.debian.org/debian/pool/main/x/xarchon/${pkgname}_${pkgver}.orig.tar.gz :
#  sed -i -e "s/\/usr\/bin\/install/\/bin\/install/g" Makefile
#  sed -i -e "s/\/usr\/bin\/install/\/bin\/install/g" data/Makefile
#  sed -i -e "s/\/usr\/bin\/install/\/bin\/install/g" src/Makefile
  make || return 1
  install -d $pkgdir/usr/share/xarchon/archon
  # we copy those folders first otherwise it won't install
  cp -fr $srcdir/${pkgname}-${pkgver}.orig/data/archon  $pkgdir/usr/share/xarchon/
  make DESTDIR=$pkgdir install
}
