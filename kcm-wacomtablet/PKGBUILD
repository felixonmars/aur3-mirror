# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor: Dylon Edwards <deltaecho@archlinux.us>

_basename=wacomtablet
_content=114856
pkgname=kcm-${_basename}
pkgver=1.3.4
pkgrel=1
url="http://kde-apps.org/content/show.php/wacom+tablet?content=${_content}"
pkgdesc="KDE GUI for the Wacom Linux Drivers"
license=('GPLv2')
arch=('x86_64' 'i686')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('kcm_tablet-svn kde-wacomtablet-svn')
replaces=('kcm_tablet')
source=("http://kde-apps.org/CONTENT/content-files/${_content}-${_basename}-v${pkgver}.tar.bz2")

build()  {	
	cd ${_basename}-v${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd ${_basename}-v${pkgver}
	make DESTDIR=${pkgdir} install
}
sha256sums=('816e7d522b1ed549d36b0b24a6ace202b451c3c6d7dd58a05e1b469b1859d16f')
