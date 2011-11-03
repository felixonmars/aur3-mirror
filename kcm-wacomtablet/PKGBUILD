# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor: Dylon Edwards <deltaecho@archlinux.us>

_basename=wacomtablet
_content=114856
pkgname=kcm-${_basename}
pkgver=1.3.5
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
sha256sums=('4a8298dd213d3e27365986a30192d4c5cae5bf611d56248d23648bfee3b8fa35')
