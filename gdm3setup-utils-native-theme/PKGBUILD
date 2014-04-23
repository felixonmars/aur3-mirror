# Maintainer: NanoArch <nanoarch77@gmail.com>

pkgname=gdm3setup-utils-native-theme
_pkgname=gdm3setup-utils
pkgver=20140306
pkgrel=1
pkgdesc="Utilities to configure GDM3, autologin options and change Shell theme (native theme patch)"
arch=(any)
license=('GPL')
url="http://github.com/Nano77/gdm3setup"
source=(https://raw.github.com/Nano77/various/master/src/$_pkgname/$_pkgname-$pkgver.tar.xz
        'gdm3setup-utils-native-theme.patch')
depends=('gdm' 'gnome-shell-native-theme' 'python2-dbus')
conflicts=('gdm3setup-utils' 'gdm3setup-vala' 'gdm3setup-vala-native-theme')
provides=('gdm3setup-utils')
sha256sums=('dfdcc8f1d845335d30b2f5e39f86e95aff71ddcc26c024761037dbde8c032552'
            'f7588295dfecfa5f23b14c03aa1f61ca62715caed1be0d60fbd52cf2a677e9f2')

prepare() {
  cd ${srcdir}/$_pkgname-$pkgver
  patch -Np1 -i ${srcdir}/gdm3setup-utils-native-theme.patch
}

build() {
  cd ${srcdir}/$_pkgname-$pkgver
  make
}

package() {
  cd ${srcdir}/$_pkgname-$pkgver
  make DESTDIR=${pkgdir} install
}
