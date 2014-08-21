# Maintainer: Shaun Hammill <plloi.pllex@gmail.com>
# Contributer: Sam Stuewe <halosghost at archlinux dot info>
pkgname="pokemmo"
pkgver=20140820
pkgrel=1
pkgdesc="An MMO based on the Pokémon Universe"
arch=('any')
url="http://pokemmo.eu"
license=('custom')
depends=('java-runtime')
backup=("opt/${pkgname}/config/log4j.dtd"
        "opt/${pkgname}/config/log4j.xml"
        "opt/${pkgname}/config/main.properties"
        "opt/${pkgname}/config/sound.properties")
install="${pkgname}.install"
source=("http://pokemmo.eu/download/PokeMMO-Client.zip"
        "${pkgname}.sh"
        "${pkgname}.install")
sha256sums=('ed3d9930b53f2da89d1eda6141f7d065cc85c92596e54d6e8c2b5773eee89740'
            '95c0f9459c850e6378cd2439a76ef6c59d0efe36981082be06e1ef8c94c484ce'
            '8ceb6db076fe3c7aabcb26d1de714074586401beef2915af54e1b4f120c8d592')

package() {
   install -Dm644 PokeMMO.exe "${pkgdir}/opt/${pkgname}/PokeMMO.exe"
   install -Dm755 PokeMMO.sh "${pkgdir}/opt/${pkgname}/"
   install -Dm755 pokemmo.sh "${pkgdir}/usr/bin/${pkgname}"

   cp -dpr --no-preserve=ownership "${srcdir}"/{config,data,lib,log,roms} "${pkgdir}"/opt/"${pkgname}"/
   
   chmod 777 "${pkgdir}"/opt/"${pkgname}"/config
   chmod 666 "${pkgdir}"/opt/"${pkgname}"/config/*
}
