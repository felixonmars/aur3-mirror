# Maintainer: Feifei Jia <feifei.j at gmail dot com>
# Contributor: Yang Hamo Bai <hamo.by@gmail.com>

pkgname=linux_fetion
pkgver=2.0_beta6
pkgrel=1
pkgdesc="a KDE IM client, Using China Mobile's Fetion Protocol"
arch=('i686' 'x86_64')
url="http://www.libfetion.org/"
license=('GPL')
depends=("qt>=4.3" "curl" "gcc-libs" "libstdc++5")
makedepends=("gcc" "make")
source=(http://libfetion-gui.googlecode.com/files/${pkgname}_v${pkgver}.tar.gz)
md5sums=('0c738fe4436a9217749d9bc3d7fdb098')

build() {
    cd ${srcdir}/${pkgname}_v${pkgver}
    sed -i 's/are online/ are online/' src/fxaccountTab.cpp

    if [[ "${CARCH}" == "x86_64" ]]
    then
        ./64_libfetion.sh
    fi

    qmake || return 1

    # Change link order to fix build error, just a work-around
    sed -i -e "/^LIBS/s/ -lcurl//" Makefile
    sed -i -e "/^LIBS/s/$/ -lcurl/" Makefile

    make || return 1

    mkdir -p ${pkgdir}/usr/share/pixmaps/
    cp -rf ./misc/fetion.png ${pkgdir}/usr/share/pixmaps/
    chmod 644 ${pkgdir}/usr/share/pixmaps/fetion.png

    mkdir -p ${pkgdir}/usr/share/app-install/icons/
    cp ./misc/fetion.png ${pkgdir}/usr/share/app-install/icons/
    chmod 644 ${pkgdir}/usr/share/app-install/icons/fetion.png

    mkdir -p ${pkgdir}/usr/share/libfetion/
    cp -rf README COPYING ChangeLog CREDITS.txt resource skins ${pkgdir}/usr/share/libfetion/
    chmod -R 755 ${pkgdir}/usr/share/libfetion/
    find ${pkgdir}/usr/share/libfetion/ -type d -exec chmod 755 {} \;
    find ${pkgdir}/usr/share/libfetion/ -type f -exec chmod 644 {} \;

    # Modify font size in chat window
    #sed -i '52 s/15px/13px/' ${pkgdir}/usr/share/libfetion/skins/Fx_Zww/style.css

    # Remove Chinese files
    #rm -f ${pkgdir}/usr/share/libfetion/resource/fetion_utf8_CN.*
    #rm -f ${pkgdir}/usr/share/libfetion/resource/qt_zh_CN.qm

    mkdir -p ${pkgdir}/usr/share/applications/
    cp -rf ./misc/LibFetion.desktop ${pkgdir}/usr/share/applications/
    chmod 644 ${pkgdir}/usr/share/applications/LibFetion.desktop

    mkdir -p ${pkgdir}/usr/bin
    cp -rf linux-fetion ${pkgdir}/usr/bin
    strip ${pkgdir}/usr/bin/linux-fetion
    chmod +x ${pkgdir}/usr/bin/linux-fetion
}
