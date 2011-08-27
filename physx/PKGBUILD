# Maintainer: Gunnar Kriik [krigun] <gunnar[dot]kriik[at]gmail[dot]com> 
# Contributor: Gunnar Kriik [krigun] <gunnar[dot]kriik[at]gmail[dot]com> 

pkgname=physx
pkgver=2.8.1
pkgrel=1
pkgdesc="A large physics middleware library for game production"
arch=('i686')
url="http://www.nvidia.com"
license=('custom')
makedepends=('rpmextract')
depends=('freeglut')
options=(docs !strip)
install=(physx.install)
source=(http://developer.download.nvidia.com/PhysX/${pkgver}/PhysX_${pkgver}_SDK_CoreLinux_rpm.tar.gz)
md5sums=('beeabb4b0cfd278152cac147571480e1')

build() {
  cd $startdir/src
  
  rpmextract.sh libphysx-$pkgver-$pkgver-5.i386.rpm
  rpmextract.sh libphysx-common-$pkgver-5.i386.rpm
  rpmextract.sh libphysx-dev-$pkgver-$pkgver-5.i386.rpm
  rpmextract.sh libphysx-doc-$pkgver-$pkgver-5.i386.rpm
  rpmextract.sh libphysx-extras-$pkgver-$pkgver-5.i386.rpm
  rpmextract.sh libphysx-samples-$pkgver-$pkgver-5.i386.rpm
  
  mv usr/sbin usr/bin
  
  cp -R usr/ $startdir/pkg
  cp -R etc/ $startdir/pkg
  
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp usr/share/doc/libphysx-common/copyright $pkgdir/usr/share/licenses/$pkgname/
  
  cd $startdir/pkg/usr/lib/PhysX/v$pkgver
  ln -s libPhysXCore.so.1 libPhysXCore.so
  ln -s libNxCooking.so.1 libNxCooking.so
  ln -s libNxCharacter.so.1 libNxCharacter.so
  
  cd $startdir/pkg/usr/lib
  ln -s libPhysXLoader.so.1 libPhysXLoader.so
}
