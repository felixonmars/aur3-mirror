# Current maintainer: kozec <kozec at kozec dot com>
# Original maintainer: Mathias Baumann <marenz@supradigital.org> 

pkgname=lib32-physx
pkgver=2.8.1
pkgrel=1
pkgdesc="A large physics middleware library for game production"
arch=('x86_64')
url="http://www.nvidia.com"
license=('custom')
makedepends=('rpmextract')
depends=('lib32-freeglut')
conflicts=('physx')
install=lib32-physx.install
options=(docs !strip)
source=(http://developer.download.nvidia.com/PhysX/${pkgver}/PhysX_${pkgver}_SDK_CoreLinux_rpm.tar.gz
	lib32-physx.conf)

build() {
  cd $srcdir
  
  rpmextract.sh libphysx-$pkgver-$pkgver-5.i386.rpm
  rpmextract.sh libphysx-common-$pkgver-5.i386.rpm
  rpmextract.sh libphysx-dev-$pkgver-$pkgver-5.i386.rpm
  rpmextract.sh libphysx-doc-$pkgver-$pkgver-5.i386.rpm
  rpmextract.sh libphysx-extras-$pkgver-$pkgver-5.i386.rpm
  rpmextract.sh libphysx-samples-$pkgver-$pkgver-5.i386.rpm
}

package() {
  cd $srcdir
  
  mkdir -p $pkgdir/usr/lib32/ || return 1
  cp -R usr/lib/*.so* $pkgdir/usr/lib32/ || return 1
  cp -R usr/lib/PhysX $pkgdir/usr/lib32/ || return 1
  cp -R usr/include/ $pkgdir/usr/include/ || return 1
  cp -R etc/ $startdir/pkg || return 1
  mkdir -p $pkgdir/etc/ld.so.conf.d
  cp $srcdir/lib32-physx.conf $pkgdir/etc/ld.so.conf.d
  
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp usr/share/doc/libphysx-common/copyright $pkgdir/usr/share/licenses/$pkgname/
  
  cd $startdir/pkg/usr/lib32/PhysX/v$pkgver || return 1
  ln -s libPhysXCore.so.1 libPhysXCore.so
  ln -s libNxCooking.so.1 libNxCooking.so
  ln -s libNxCharacter.so.1 libNxCharacter.so
  
  cd $startdir/pkg/usr/lib32 || return 1
  ln -s libPhysXLoader.so.1 libPhysXLoader.so
}

md5sums=('beeabb4b0cfd278152cac147571480e1'
         '1e6dc0c7d3d8dafc08de955d3003fa14')
