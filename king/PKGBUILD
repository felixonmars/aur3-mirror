# Maintainer: Wendell Smith <wackywendell@gmail.com>
pkgname=king
pkgver=2.21.120420
pkgrel=1
pkgdesc="Kinemage, Next Generation is an interactive system for three-dimensional vector graphics, although its first use was to display macromolecular structures for biophysical research."
arch=('any')
url="http://kinemage.biochem.duke.edu/software/king.php"
license=('custom')
groups=()
depends=('bash' 'java-environment')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=king.install
changelog=
source=(king.desktop king.sh http://kinemage.biochem.duke.edu/php/downlode.php?filename=/downloads/software/king/$pkgname.$pkgver.zip)
noextract=()
md5sums=('b99021ce4d50705fc42d884c30576825'
         'a9ce3104d6425669ea77039a3ff70137'
         'a10f4e8812245230fb3fd7c98376ecd1')

build() {
    cd "${srcdir}"
    srcdir2="king-2.21"
    unzip -oj "$srcdir2"/king.jar king/images/kingicon20.png
    true
}

package() {
    srcdir2="${srcdir}/king-2.21"
    install -Dm644 "${srcdir}/kingicon20.png" "${pkgdir}/usr/share/pixmaps/king.png"
    install -Dm644 "${srcdir2}/LICENSE.html" "${pkgdir}/usr/share/licenses/king/LICENSE.html"

    install -Dd "${srcdir2}" "${pkgdir}/usr/share/king/"
    mv -T "${srcdir2}" "${pkgdir}/usr/share/king/"

    #echo -e '#!/bin/sh\nexec java -Xms32m -Xmx128m -jar /usr/share/king/king.jar "$@"' > "${pkgdir}/usr/bin/king"
    #chmod 755 "${pkgdir}/usr/bin/king"

    install -Dm644 "${srcdir}/kingicon20.png" "${pkgdir}/usr/share/pixmaps/king.png"
    install -Dm644 "${srcdir}/king.desktop" "${pkgdir}/usr/share/applications/king.desktop"
    install -Dm755 "${srcdir}/king.sh" "${pkgdir}/usr/bin/king"
}
