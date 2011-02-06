# Contributor: David Ferreira - FZ <davidferreira.fz at gmail.com>

pkgname=spaceshooter
pkgver=1.4
pkgrel=2
arch=('i686')
pkgdesc="A classic game in the style shoot'up, having as base the thematic of Star Trek."
url="http://spaceshooter.dukitan.com/"
depends=('sdl' 'sdl_mixer' 'sdl_image' 'sdl_net')
license=('GPL')
source=(http://codigolivre.org.br/frs/download.php/5672/SpaceShooter.1.4.0.bin.linux.tar.gz \
        ${pkgname}.desktop \
        ${pkgname}.png)
md5sums=('b7a1db9f306010040b04afaf86f0a3ea'
         '8c7129edc947cd2e136d4820595ca5ee'
         '5e31d7d9fdc41eb7eb4b5b9efdaa6651')


build() {

    #Movendo
    chmod -s -R ${startdir}/src/opt/
    mkdir -p ${pkgdir}/opt/games
    mv ${startdir}/src/opt/spaceshooter ${pkgdir}/opt/games


    #Permissoes para salvar
    chown root:users -R ${pkgdir}/opt/games/${pkgname}
    chmod 2775 ${pkgdir}/opt/games/${pkgname}
    chmod 2775 ${pkgdir}/opt/games/${pkgname}/data/etc
    chmod 2775 ${pkgdir}/opt/games/${pkgname}/data/etc/toprecord.top
    chmod 2775 ${pkgdir}/opt/games/${pkgname}/data/screen
    chmod  755 ${pkgdir}/opt/games/${pkgname}/SpaceShooter


    #Icones
    install -D -m644  ${pkgname}.png       ${pkgdir}/usr/share/pixmaps/${pkgname}.png

    #Atalho
    install -D -m644 ${pkgname}.desktop    ${pkgdir}/usr/share/applications/${pkgname}.desktop

}
