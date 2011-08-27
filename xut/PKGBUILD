# Maintainer: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=xut
pkgver=0.2.1
pkgrel=1
pkgdesc="Button football simulation, a turn based game where you play football (soccer) with buttons, boxes and simple rules."
arch=('i686' 'x86_64')
url="http://xut.dnteam.org/"
license=('GPL2')
makedepends=('make' 'autoconf' 'gettext')
depends=('sdl_image' 'sdl_ttf' 'openal' 'cal3d' 'libvorbis' 'libgl')
source=(http://downloads.sourceforge.net/digenv/${pkgname}-${pkgver}.tar.bz2  xut.desktop)
md5sums=('407d9f543ec533f85358c9166ff27a5c'
         '766690e99d14888abd9a251512bcbdf4')
LDFLAGS=""

build() {
cd ${srcdir}/${pkgname}
./configure --prefix=/usr
make
}

package() {
cd ${srcdir}/${pkgname}
mkdir -p ${pkgdir}/usr/bin
install -c -m 755 bin/xut ${pkgdir}/usr/bin
sh install.sh ${pkgdir}/usr/share xut install
cd po
make DESTDIR=${pkgdir} install > /dev/null
mkdir -p ${pkgdir}/usr/share/applications
install ${srcdir}/xut.desktop ${pkgdir}/usr/share/applications
}
