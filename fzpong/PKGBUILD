# Contributor: David Ferreira - FZ <davidferreira.fz at gmail.com>

pkgname=fzpong
pkgver=2.4
pkgrel=2
arch=('i686')
pkgdesc="A classic arcade game (pong)"
url="http://www.dukitan.com/portal/fzpong"
depends=('sdl' 'sdl_mixer' 'sdl_image')
license=('GPL')
source=(http://downloads.sourceforge.net/project/pjmoo/FZPong/2.4/FZPong.2.4.bin.linux.tar.gz \
        ${pkgname}.desktop)

md5sums=('a6d6ffcf3726cb44f681b32556c535fd'
         '8608f24e889d93e2dff8361d9860b69a')


build() {

    #Movendo
    chmod -s -R ${startdir}/src/opt/
    mv ${startdir}/src/opt ${pkgdir}/


    #Permissoes para salvar
    chown root:users -R ${pkgdir}/opt/games/fzpong
    chmod 2775 ${pkgdir}/opt/games/fzpong
    chmod 2775 ${pkgdir}/opt/games/fzpong/data/etc
    chmod 2775 ${pkgdir}/opt/games/fzpong/data/screen
    chmod  755 ${pkgdir}/opt/games/fzpong/FZPong


    #Icones
    install -D -m644 ${pkgdir}/opt/games/${pkgname}/${pkgname}.xpm       ${pkgdir}/usr/share/pixmaps/${pkgname}.xpm
    install -D -m644 ${pkgdir}/opt/games/${pkgname}/${pkgname}_16x16.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png
    install -D -m644 ${pkgdir}/opt/games/${pkgname}/${pkgname}_32x32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png
    install -D -m644 ${pkgdir}/opt/games/${pkgname}/${pkgname}_48x48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png
    install -D -m644 ${pkgdir}/opt/games/${pkgname}/${pkgname}_64x64.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png

    #Atalho
    install -D -m644 ${pkgname}.desktop    ${pkgdir}/usr/share/applications/${pkgname}.desktop

}
