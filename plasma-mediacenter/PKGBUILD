# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=plasma-mediacenter
pkgver=1.3.0
pkgrel=1
pkgdesc="A Media Center for the KDE Software Compilation based on plasma technology"
arch=("i686" "x86_64")
url="http://community.kde.org/Plasma/Plasma_Media_Center"
screenshot="https://lh4.googleusercontent.com/-XcKN699oYps/TlUtlEZ6X6I/AAAAAAAAAD0/L84wlkRWmH8/s912/welcome.png"
license=('GPL3')
depends=('kdebase-runtime' 'qtmobility')
makedepends=('cmake' 'automoc4' )
source=("http://download.kde.org/stable/plasma-mediacenter/${pkgver}/src/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('7ea3c50d9fa5499f50c8e00d9d23a12d7967a340dc53986ea1099669769e46ca')

build() {
  cd ${srcdir}/${pkgname}

  cmake -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) -DCMAKE_BUILD_TYPE=Release -DKDE4_BUILD_TESTS=Off .
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}

  make DESTDIR=$pkgdir install || return 1
}

# vim:set ts=2 sw=2 et:
