
# Maintainer: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=komi
pkgver=1.04
pkgrel=2
pkgdesc="The basic aim is to collect all the money by extending Komi the Space Frog's tongue, while avoiding the bad guys.."
arch=('i686' 'x86_64')
url="http://komi.sourceforge.net/"
license=('GPL')
depends=('sdl_mixer')
madepends=('make')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz Makefile.diff komi.desktop)
md5sums=('d1ab0e5429f6aa16169cf989d144e39a' 'd7c4545e7478c7f251fe8c937a231d94'  '21973aaa06e821747cca1d30feeeecb6')

build() {
cd ${srcdir}/${pkgname}-${pkgver}
patch -p0 < ../Makefile.diff || return 1
make || return 1
mkdir -p ${pkgdir}/usr/share/{applications,komidata}
cp -R komidata/* ${pkgdir}/usr/share/komidata
install ${srcdir}/komi.desktop ${pkgdir}/usr/share/applications
mkdir -p ${pkgdir}/usr/bin
install -m755 komi ${pkgdir}/usr/bin/
}
