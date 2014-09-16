# Maintainer: Никола "hauzer" Вукосављевић <hauzer@gmx.com>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Swen Simon <swsimon at gmail dot com>
# Contributor: Shaun Westmacott <xyem@electricjungle.org>

pkgname=epsxe-improved
_pkgname=epsxe
pkgver=1.9.0
pkgrel=2
pkgdesc='Enhanced PSX emulator (clean PKGBUILD, using epsxe-launcher-bash-unionfs)'
url='http://epsxe.com'
arch=('i686' 'x86_64')
depends=('libtinfo' 'unionfs-fuse')
[ "$CARCH" == "i686" ] && depends+=('gtk' 'gtk2' 'sdl_ttf')
[ "$CARCH" == "x86_64" ] && depends+=('lib32-gtk' 'lib32-gtk2' 'lib32-ncurses' 'lib32-libxt' 'lib32-sdl_ttf' 'lib32-alsa-lib')
conflicts=('epsxe')
provides=('epsxe')
license=('unknown')
install="${_pkgname}.install"
options=(!strip)
source=('http://www.epsxe.com/files/epsxe190lin.zip'
        "${_pkgname}.sh"
        "${_pkgname}.desktop"
        "${_pkgname}.png")
sha512sums=('15c24624cf492e003bf09a68a1bd9de5b05e2fea8b7d958d487f0e0d97c312aa8c7535e2210a5fb65834a717917f9fd4b34187920465236c2c7c4a00cb6bdd66'
            '4d7edbc48ffdfcd78612a23083aea8add3b6d22180a117d30d0119a44c1fe1f18c4c557cd9a2350a3d54bdac2de339b489420ef07ed51c10976d832fa5d7ddb1'
            '3f7cc7978191096b3f0c44da9b79144c87fdff81e465001f93866856128d04d27318577045d0275f82d80ed7ca48276179caacee70c4f3312fd9d1d43bf1d726'
            '34effacedce9040e0d931215a15678a18a319e49dc8b0472fcfd171721a9a23dec531fa588c3020d166a3f0a7f78d2b35fb8913d528343d4d25a5fb3289b01a6')

package() {
    install -m755 -D "${srcdir}/epsxe" "${pkgdir}/opt/epsxe/epsxe"
    install -m644 -D "${srcdir}/keycodes.lst" "${pkgdir}/opt/epsxe/keycodes.lst"
    install -m775 -g games -d "${pkgdir}/opt/epsxe/"{cfg,memcards,sstates}
    
    install -m755 -D "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -m644 -D "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -m644 -D "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    for _file in 'ePSXe_en.txt' 'ePSXe_sp.txt' 'epsxe_linux_en.txt' 'epsxe_linux_sp.txt' ; do
        install -m644 -D "${srcdir}/docs/${_file}" "${pkgdir}/usr/share/doc/${_pkgname}/${_file}"
    done
}

