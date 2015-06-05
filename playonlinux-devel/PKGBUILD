# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=playonlinux-devel
_pkgname=playonlinux
pkgver=405.ea47305
pkgrel=1
pkgdesc="A piece of software based on Wine which allows you to easily install and use numerous games and apps designed to run with Microsoft Windows (latest development release based on POL5)"
arch=('any')
license=('GPL3')
url="https://www.playonlinux.com/"
depends=('wine' 'imagemagick' 'xterm' 'wxpython' 'cabextract' 'unzip' 'mesa-demos'
         'gnupg' 'icoutils' 'xdg-user-dirs' 'libxmu' 'netcat' 'wget' 'p7zip'
         'java-runtime' 'maven' 'gradle' 'java-openjfx')
makedepends=('git')
provides=('playonlinux')
conflicts=('playonlinux' 'playonlinux-git')
source=("${_pkgname}.sh"
        "${_pkgname}.desktop"
        "${_pkgname}.png"
        "${_pkgname}"::"git+https://github.com/PlayOnLinux/POL-POM-5.git")
sha256sums=('2164345ed578056d46e0e816ac6c80b3fdaf011ae23043569dd047fb919eb5fe'
            'c5507314096e39293ec27988721e9d7bf3fa61a2bb2cddcc0578ef31d6d90070'
            'bd127b24a4037e70dcec1d3cee6f1a72124c5275ce392a6f6db6749eda8fced3'
            'SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "${srcdir}/${_pkgname}"
    export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"

    mvn assembly:assembly
}

package() {
    cd "${srcdir}/${_pkgname}"

    # Executables
    install -D -m755 "../${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -D -m644 "target/playonlinux-5.0-SNAPSHOT-jar-with-dependencies.jar" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.jar"

    # Desktop launcher with icon
    install -D -m644 "../${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -D -m644 "../${_pkgname}.png"     "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
