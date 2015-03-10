# Maintainer: Nathan Chowning <nathan@chowning.me>

pkgname=noteskin-robot-3dp-sm5
pkgver=1.0
pkgrel=1
pkgdesc="Robot 3D Plus Noteskin ported to StepMania 5 by Jousway"
url="http://zettbou.co.uk"
arch=("any")
license=("unknown")
depends=('stepmania>=5')
source=(http://zettbou.co.uk/Unlimited_Stepman_Works/_Noteskin/SM5/Dance/USWRobot3DSM5p.rar)
sha256sums=("1d457d09a1e98b9cbe5f59f15d0e9198542433a245d335027b18976567d9710d")

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/opt/stepmania/NoteSkins/dance"
    cp -r "USWRobot3DSM5+" "${pkgdir}/opt/stepmania/NoteSkins/dance/Robot"
}
