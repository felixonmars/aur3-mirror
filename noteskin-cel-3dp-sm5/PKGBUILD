# Maintainer: Nathan Chowning <nathan@chowning.me>

pkgname=noteskin-cel-3dp-sm5
pkgver=1.0
pkgrel=1
pkgdesc="Cel 3D Plus Noteskin ported to StepMania 5 by Jousway"
url="http://zettbou.co.uk"
arch=("any")
license=("unknown")
depends=('stepmania>=5')
source=(http://zettbou.co.uk/Unlimited_Stepman_Works/_Noteskin/SM5/Dance/USWCel3DSM5p.rar)
sha256sums=("5c3ff3eb3d82d9fb92b6eac4f63bbce5074f14b3bef9ee9e48cec57a26be7f52")

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/opt/stepmania/NoteSkins/dance"
    cp -r "USWCel3DSM5+" "${pkgdir}/opt/stepmania/NoteSkins/dance/Cel"
}
