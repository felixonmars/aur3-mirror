# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor: Dylon Edwards <deltaecho@archlinux.us>
# vim:set ft=sh:

_basename=wacomtablet
_content=114856
pkgname=kcm-$_basename
pkgver=1.99.8
pkgrel=1
url="http://kde-apps.org/content/show.php/wacom+tablet?content=$_content"
pkgdesc="KDE GUI for the Wacom Linux Drivers"
license=('GPLv2')
arch=('x86_64' 'i686')
depends=('kdebase-workspace' 'xf86-input-wacom')
makedepends=('cmake' 'automoc4')
conflicts=('kcm_tablet-svn kde-wacomtablet-svn')
replaces=('kcm_tablet')
source=("http://kde-apps.org/CONTENT/content-files/$_content-$_basename-$pkgver.tar.gz")

build()  {
	cd $_basename-$pkgver
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd $_basename-$pkgver
	make DESTDIR="$pkgdir" install
}
sha256sums=('390055e427ccee647d2a4f58f97e117f46f9298bb28bf0eff6f3bd699c3f79b3')
