# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=gradle-doc
_pkgname=gradle
pkgver=1.12
pkgrel=1
pkgdesc="A powerful build system for the JVM (documentation and samples)"
arch=('any')
url="http://www.gradle.org/"
license=('APACHE')
optdepends=('gradle')
source=(http://downloads.gradle.org/distributions/$_pkgname-$pkgver-all.zip)
options=(!strip)

package(){
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # create the necessary directory structure
    mkdir -p "${pkgdir}/usr/share/${_pkgname}/doc/"
    mkdir -p "${pkgdir}/usr/share/${_pkgname}/samples/"

    # copy across documentation and samples
    cp --recursive docs/* "${pkgdir}/usr/share/${_pkgname}/doc/"
    cp --recursive samples/* "${pkgdir}/usr/share/${_pkgname}/samples/"

}

md5sums=('f957126d8e84d7ee7c859d02c2ae1fc1')
sha1sums=('ff641926092c64ffe6dc9ce3477d582b368fbaae')
