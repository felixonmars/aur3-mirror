# Maintainer: Faheem Pervez <trippin1 bij the-proper-name-for-Google's-email-service>
_origpkgname=plasmoid-capslockinfo
pkgname="kdeplasma-applets-$_origpkgname"
pkgver=0.1
pkgrel=1
pkgdesc="An applet to show the state of the caps & num lock keys using the keystate engine"
arch=('x86_64' 'i686')
url="http://kde-apps.org/content/show.php/plasmoid-capslockinfo?content=156181"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake')
install=
source=("http://kde-apps.org/CONTENT/content-files/156181-$_origpkgname-$pkgver.tar.gz")
sha256sums=('3f0ca5a47ef0a31a41eaf5b6f0881aea3161406ec2e8e2ea99702217e6cc935d')

prepare() {
	mkdir build
}

build() {
	cd build
	cmake "../$_origpkgname-$pkgver" \
	  -DCMAKE_INSTALL_PREFIX="$(kde4-config --prefix)" \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DQT_QMAKE_EXECUTABLE=qmake-qt4
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
}
