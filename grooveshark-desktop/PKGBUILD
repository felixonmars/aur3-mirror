# Maintainer: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=grooveshark-desktop
pkgver=20101222.37
pkgrel=2
pkgdesc="Grooveshark desktop client for VIP users using adobe-air"
arch=("i686" "x86_64")
url="http://vip.grooveshark.com/summary"
license=("unknown")
makedepends=("unzip")

if [ "${CARCH}" == "x86_64" ]; then
    _air_depend="bin32-adobe-air"
elif [ "${CARCH}" == "i686" ]; then
    _air_depend="adobe-air"
fi

depends=("${_air_depend}" "hicolor-icon-theme" "xdg-utils")

_filename="GSDesktop_${pkgver}.air"
source=(
    "http://preview.grooveshark.com/desktop/${_filename}"
    "grooveshark-desktop.sh" "grooveshark.desktop")
install=grooveshark-desktop.install
noextract=(${_filename})

build() {
    _builddir=${srcdir}/grooveshark-desktop-${pkgver}


    rm -rf ${_builddir}
    mkdir ${_builddir}


    unzip ${_filename} -d ${_builddir} > /dev/null || exit 1

    cd ${srcdir}/

    #install -d ${pkgdir}/usr/bin
    #install -d ${pkgdir}/opt/${pkgname}
    
    ## main files
    install -D ${_filename} ${pkgdir}/opt/${pkgname}/grooveshark-desktop.air

    ## desktop launcher
    install -Dm644 "grooveshark.desktop" \
        ${pkgdir}/usr/share/applications/grooveshark.desktop || exit 1

    for s in 16 32 48 128; do
        install -Dm644 ${_builddir}/icons/${s}x${s}.png \
            ${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/grooveshark-desktop.png || exit 1
    done

    ## launch script
    install -Dm755 "grooveshark-desktop.sh" \
        ${pkgdir}/usr/bin/grooveshark-desktop
}

md5sums=('dd00e484a2709b3633e2a1707527bf5b'
         'b29b998d00b73e254db3124a3dcb607d'
         '5da56775f4123e3eaf6205c4bf7412ec')
