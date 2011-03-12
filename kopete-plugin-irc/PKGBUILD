# Contributor: feufochmar <feufochmar@d-20.fr>
#

pkgname=kopete-plugin-irc
pkgver=0.1.2
pkgrel=2
pkgdesc="Enable IRC protocol in Kopete"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/kopete+irc+plugin?content=113720"
license=('GPL')
depends=('kdenetwork-kopete' 'libircclient-qt-compat')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/113720-irc.tar.gz")
md5sums=('ebf77e66214ee61de38a0277c47a0d27')

build() {
cd ${srcdir}/irc
cmake -DCMAKE_INSTALL_PREFIX=/usr CMakeLists.txt
make || return 1
make DESTDIR=${pkgdir} install
}
