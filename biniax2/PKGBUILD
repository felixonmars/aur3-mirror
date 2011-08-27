# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Maintainer: schuay <jakob.gruber@gmail.com>

pkgname=biniax2
pkgver=1.30
pkgrel=4
pkgdesc="An innovative puzzle game with unique gameplay and a bright, colorful interface."
arch=('i686' 'x86_64')
url="http://biniax.com/index2.html"
license=('custom')
depends=('sdl_mixer' 'sdl_image')
source=("http://mordred.dir.bg/biniax/${pkgname}-${pkgver}-fullsrc.tar.gz"
        "biniax2-desktop"
        "biniax2-icon"
        "biniax2-script"
        "hof.patch")
md5sums=('53e90cf42b825af23e086f4562234ae3'
         'cf05994a576de3b3d35a4d80ad4a8502'
         'c40c6fc5e4620a37274454264f269f92'
         '2ef8b4847dacf3e45fee2994d4d26b8c'
         'ce852ed0917e28431a6c2c0e955c0524')

build() {
    cd "${srcdir}"
    patch -Np1 < "${srcdir}"/hof.patch # store hall of fame in home dir
    make
}
package() {
    cd "${srcdir}"

    mkdir -p "${pkgdir}"/usr/share/biniax2/data/

    install -D -m644 LICENSE.txt "${pkgdir}"/usr/share/licenses/biniax2/LICENSE.txt

    cp -r data/ "${pkgdir}"/usr/share/biniax2/
    find "${pkgdir}"/usr/share/biniax2/ -type f -exec chmod 644 {} \;

    install -Dm644 biniax2-icon "${pkgdir}"/usr/share/pixmaps/biniax2.png
    install -Dm644 biniax2-desktop "${pkgdir}"/usr/share/applications/biniax2.desktop
    install -Dm755 biniax2-script "${pkgdir}"/usr/bin/biniax2
    install -Dm755 biniax2 "${pkgdir}"/usr/share/biniax2/
}
