_pkgname=raw2vmdk
pkgname=raw2vmdk-git
pkgver=20120103
pkgrel=1
pkgdesc="Utility that converts RAW disk images, like images created by dd to VMDK disk format"
arch=('any')
url="https://github.com/Zapotek/raw2vmdk"
source=('raw2vmdk')
md5sums=('c8e6db9847d6adaad582eb3365c1be74')
license=('GPL')
depends=('java-environment')
makedepends=('apache-ant')

_gitroot="https://github.com/Zapotek/raw2vmdk.git"
_gitname="master"

build() {

    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cd "${srcdir}/master"
    source "/etc/profile.d/apache-ant.sh"
    ant clean
    ant build
    ant

}

package() {

    cd "${srcdir}/master"

    install -d "${pkgdir}/usr/share/java/${_pkgname}"
    install -Dm644 "target/${_pkgname}.jar"  "${pkgdir}/usr/share/java/${_pkgname}"

    install -d "${pkgdir}/usr/share/doc/${_pkgname}"
    install -Dm644 {AUTHORS,CHANGELOG,README} "${pkgdir}/usr/share/doc/${_pkgname}"

    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/raw2vmdk" "${pkgdir}/usr/bin"

}
