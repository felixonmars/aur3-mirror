# Maintainer: Skydrome <skydrome@i2pmail.org>

pkgname=yajsw
pkgver=11.11
pkgrel=1
pkgdesc="Yet Another Java Service Wrapper"
url="https://yajsw.sourceforge.net"
arch=('x86_64' 'i686')
license=('LGPL')
depends=('java-environment>=7')
source=("http://downloads.sourceforge.net/project/yajsw/yajsw/yajsw-stable-${pkgver}/yajsw-stable-${pkgver}.zip")
md5sums=('3b4fff8475e48cb001c38a42c27c953b')


build() {
    cd "${srcdir}/yajsw-stable-${pkgver}/build/gradle"

    source /etc/profile.d/jdk.sh
    source /etc/profile.d/gradle.sh
    export GRADLE_USER_HOME="$PWD"

    sh gradlew.sh
}

package() {
    cd "${pkgdir}"

    mkdir -p usr/share/{java,licenses}/yajsw
    cd usr/share/java/yajsw

    cp -r ${srcdir}/yajsw-stable-${pkgver}/* .
    rm -r bat build src webapps #tmp log

    mv LICENSE.txt ../../licenses/yajsw/LICENSE
}

