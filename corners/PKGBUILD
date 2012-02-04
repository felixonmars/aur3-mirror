
# Maintainer: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=corners
pkgver=1.4
pkgrel=2
pkgdesc="Logical board game as known as Halma or Chinese checkers. The game is played by two players on opposing corners of the board."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/corners/"
license=(GPL)
depends=('gtk2')
madepends=('make')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2  corners.desktop)
md5sums=('4da8cebcedb0562c3d9995e42d17b8c5' '22a5f101be7bf87f4808827be876c178')


build() {
cd ${srcdir}/${pkgname}-${pkgver}
sed -i 's_/usr/local_/usr_' makefile
make || return 1
mkdir -p ${pkgdir}/usr/share/corners
cp -r corners corners.png corners-no-bg.png ${pkgdir}/usr/share/corners/
cp -r locale ${pkgdir}/usr/share
mkdir -p ${pkgdir}/usr/bin
echo "cd '/usr/share/corners/' && ./corners" > ${pkgdir}/usr/bin/corners
mkdir -p ${pkgdir}/usr/share/applications
chmod a+x ${pkgdir}/usr/bin/corners
install ${srcdir}/corners.desktop ${pkgdir}/usr/share/applications
}
