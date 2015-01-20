# Maintainer: Your Name <youremail@domain.com>
# Contributor: Elmo Todurov <todurov@gmail.com>
pkgname=smestorage-pro
pkgver=4.1.3
pkgrel=1
epoch=
pkgdesc="Linux Cloud Tools encompass a Cloud Drive and graphical Cloud Explorer and sync tools to sync cloud files from your preferred provider to/from the Linux desktop "
arch=('i686' 'x86_64')
url="http://www.smestorage.com/wiki/linuxcloudtools"
license=('custom')
groups=()
depends=( 'perl-fuse' 'perl-timedate' 'perl-html-parser' 'perl-libwww' 'perl-xml-simple' 'qt4' 'unzip')
makedepends=('deb2targz')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://storagemadeeasy.com/files/7f54f35a8fcd247cd84f5c1f9e42b5f7.zip")
noextract=()
md5sums=('07a4d2c9f6ec177c6ab1929f1ace800b')

package() {
cd "$srcdir" 
unzip -o *.zip
deb2targz *.deb
tar axf *.tar.gz
mv ./usr ${pkgdir} || return 1
mv ${pkgdir}/usr/share/sme_install ./sme_install

cd sme_install
cd smeclient
qmake-qt4
make
install -m755 smeclient ${pkgdir}/usr/bin/smeclient
cd ..

cd smeexplorer
qmake-qt4
sed -e "5a\ #include <unistd.h>" -i smestorageexplorer.cpp
make
install -m755 smeexplorer ${pkgdir}/usr/bin/smeexplorer
cd ..

cd smesynccenter
qmake-qt4
sed -e "6a\ #include <unistd.h>" -i syncwidget.cpp
sed -e "7a\ #include <unistd.h>" -i syncpropertieswidget.cpp
make
install -m755 smesynccenter ${pkgdir}/usr/bin/smesynccenter
cd ..
}
