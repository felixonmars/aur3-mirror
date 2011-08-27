# Contributor: quantax -- contact via Arch Linux forum or AUR

pkgname=epsxe-launcher-bash
pkgver=0.1
pkgrel=1
pkgdesc="Bash launcher for the Enhanced PSX Emulator."
arch=(any)
url="http://www.epsxe.com/"
license=('custom')
depends=(bash epsxe)
conflicts=(epsxe-launcher-python)
source=('http://www.emutalk.net/attachment.php?s=66e166ac12da98f8cd0b69aac10a3f83&attachmentid=23286&stc=1&d=1112148691'
        epsxe.bash
        epsxe.desktop)
md5sums=('04eb80b18e4186162820f944f5400390'
         '197bb7f58c4aa0ba08a94d3e1a76e815'
         'f6b1bd3304093ca22215e6e48525758f')

build() {
    cd "${srcdir}"
    install --mode=755 -D epsxe.bash "${pkgdir}/usr/bin/epsxe"
    install --mode=644 -D epsxe.desktop \
            "${pkgdir}/usr/share/applications/epsxe.desktop"
    # Is an ugly icon are better than none?
    install --mode=644 -D 'attachment.php?s=66e166ac12da98f8cd0b69aac10a3f83&attachmentid=23286&stc=1&d=1112148691' \
            "${pkgdir}/usr/share/pixmaps/epsxe_64x64.png"
}

