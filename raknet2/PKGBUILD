# Contributor: Kevin Whitaker <eyecreate at gmail dot com>
pkgname=raknet2
pkgver=2.0
pkgrel=1
pkgdesc="Cross platform C++ network library (GPL version)"
arch=('i686' 'x86_64')
url="http://www.jenkinssoftware.com/"
license=('GPL')
#makedepends=('autoconf')
source=(http://www.sumwars.org/data/Raknet2_0.tar.gz)
md5sums=('bfdc95cf31d1381fb97631a3f07bc6c8')



build() {
  cd ${srcdir}/Raknet2_0
  make ||return 1
  cd ${srcdir}/Raknet2_0/Source
  msg "Hardcore installation action"
  
  mkdir -p ${pkgdir}/usr/lib/pkgconfig
  cp libraknet.* ${pkgdir}/usr/lib/
  cp ../Lib/linux/librak* $pkgdir/usr/lib
  cp ../Lib/linux/rakvoice.* $pkgdir/usr/lib
  mkdir -p ${pkgdir}/usr/include/raknet/
  install -m644 ../Include/*.h ${pkgdir}/usr/include/raknet/
  install -m644 ../RakNet.pc $pkgdir/usr/lib/pkgconfig
  
  msg "Hardcore cleaning action"
  mkdir -p ${pkgdir}/usr/share/raknet/
  cp -r ../Samples ${pkgdir}/usr/share/raknet/
  find ${pkgdir}/usr/share/raknet/ -iname "*vcproj*" -delete
  find ${pkgdir}/usr/share/raknet/ -exec chmod 644 '{}' \;
	msg "All done, YEAAAAAAAAHHHHHHHHHH1111!!!! +1"
} 
 
