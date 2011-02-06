# Contributor: wido <widomaker2k7@gmail.com>

pkgname=perroquet-elephant-dream
pkgver=1.0
pkgrel=1
pkgdesc="It's a exercice for Perroquet English/French"
arch=('any')
url="http://www.elephantsdream.org/"
license=('CCPL')
depends=('perroquet')
makedepends=()
install=elephant-dream-perroquet.install
source=(http://perroquet.b219.org/exercises/1.1.0/files/blender/perroquet-exercise_elephant_dream_$pkgver.tar)
md5sums=('fa82cda8b185ffec67cd6feb7923cf01')


build() {

    cd ${srcdir}
    install -Dm644 ${srcdir}/Elephants_Dream.ogg ${pkgdir}/opt/perroquet/elephants_dream/Elephants_Dream.ogg || return 1
    install -Dm644 ${srcdir}/english.srt ${pkgdir}/opt/perroquet/elephants_dream/english.srt || return 1
    install -Dm644 ${srcdir}/french.srt ${pkgdir}/opt/perroquet/elephants_dream/french.srt || return 1
    # Exercice
    install -Dm644 ${srcdir}/template.perroquet ${pkgdir}/opt/perroquet/elephants_dream/elephant-dream.perroquet || return 1
}
