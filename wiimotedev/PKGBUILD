# Contributor: <kontakt.zuf@gmail.com>
# Contributor: macer https://aur.archlinux.org/account.php?Action=AccountInfo&ID=45657
pkgname=wiimotedev
pkgver=1.4.4
pkgrel=1
pkgdesc="Wiimotedev-daemon is a core project in wiimotedev family. It works on dbus system layer, provides a full set API to communicate with wiiremotes."
arch=(i686 x86_64)
url="http://code.google.com/p/wiimotedev/"
license=('LGPL')
depends=('qt4' 'cwiid')
source=(http://wiimotedev.googlecode.com/files/wiimotedev-project-$pkgver.tar.xz gcc-new.patch)
md5sums=('04064082fb1ed3bc8d631ed3a9db5662'
         '7f071a83952cda758e53f2e71e10ded6')

build() {

cd $startdir/src/wiimotedev-project
#patch -p1 -i $srcdir/gcc-new.patch

#cmake . -DDISTRO=arch -DCMAKE_INSTALL_PREFIX=/usr -DUSE_STATIC_CWIID=OFF

cmake . -DQMAKE=qmake-qt4 -DDISTRO=arch -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_QWIIMOTEDEV=OFF -DUSE_STATIC_CWIID=OFF
make
make DESTDIR=$pkgdir install
}

