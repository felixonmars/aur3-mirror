# Contributor: gyo <gyo_at_archlinux_dot_fr>

pkgname=lfpfonts-fix
pkgver=0.83
pkgrel=3
pkgdesc="A set of fixed fonts for X."
arch=('any')
url="http://sourceforge.net/projects/xfonts/"
license=('custom:"public domain"')
depends=('xorg-fonts-encodings' 'xorg-font-utils' 'fontconfig')
install=lfpfonts-fix.install
source=(http://downloads.sourceforge.net/xfonts/${pkgname}-src-${pkgver}.tar.bz2)
md5sums=(85ccb23cd953664844034c32f213e294)

build() {
    cd ${srcdir}/${pkgname}-src/src
    ./compile || return 1
    cd ../lfp-fix/
    mkdir -p ${pkgdir}/usr/share/fonts/${pkgname}
    install -m644 *.pcf.gz ${pkgdir}/usr/share/fonts/${pkgname}/ || return 1
    install -m644 fonts.dir ${pkgdir}/usr/share/fonts/${pkgname}/ || return 1
}

