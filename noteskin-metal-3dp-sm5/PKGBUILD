# Maintainer: Nathan Chowning <nathan@chowning.me>

pkgname=noteskin-metal-3dp-sm5
pkgver=1.0
pkgrel=1
pkgdesc="Metal 3D Plus Noteskin ported to StepMania 5 by Jousway"
url="http://zettbou.co.uk"
arch=("any")
license=("unknown")
depends=('stepmania>=5')
source=(http://zettbou.co.uk/Unlimited_Stepman_Works/_Noteskin/SM5/Dance/USWMetal3DSM5p.rar)
sha256sums=("47da29d2b74fd4e768ce3b491b762c8a20158305e202cc5b144f74a22ae58b18")

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/opt/stepmania/NoteSkins/dance"
    cp -r "USWMetal3DSM5+" "${pkgdir}/opt/stepmania/NoteSkins/dance/Metal"
}
