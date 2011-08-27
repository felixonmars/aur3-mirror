
# Maintainer: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=twind
pkgver=1.1.0
pkgrel=4
pkgdesc="simple puzzle game where you must remove all of the blocks of the same color from the screen before the time runs out."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/twind/"
license=(GPL)
depends=('sdl_mixer' 'sdl_image')
madepends=('make')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz Makefile.diff twind.desktop)
md5sums=('672dfe032e1f5657996b64cd666aef50' 'b839ef331ebe2640fa8d6a048d0b09e8' '313710aced314247752e8cc70eec4183')
install=(twind.install)

build() {
cd ${srcdir}/${pkgname}-${pkgver}
patch -p0 < ../Makefile.diff
make || return 1
mkdir -p ${pkgdir}/usr/share/twind/{graphics,music,sound}
cp -r graphics/*.png ${pkgdir}/usr/share/twind/graphics
cp -r music/*.ogg ${pkgdir}/usr/share/twind/music
cp -r sound/*.wav ${pkgdir}/usr/share/twind/sound
install -D -m755 twind ${pkgdir}/usr/bin/twind
install -D ${srcdir}/twind.desktop ${pkgdir}/usr/share/applications/twind.desktop
}
