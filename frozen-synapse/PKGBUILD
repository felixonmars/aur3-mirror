# Maintainer: Sid Karunaratne <sid at karunaratne dot net>
pkgname=frozen-synapse
pkgver=1.0.32
pkgrel=1
pkgdesc="brings the simultaneous turn-based strategy genre bang up-to-date and lets you give detailed, accurate orders to your squad"
arch=('i686' 'x86_64')
url="http://www.frozensynapse.com/"
license=('custom')
_gamepkg="FS_Linux_Latest.run"
_gamesum="eab8e416aa08161fa7475dfe6f85fb98f954c722985a1fe2a3115f944d3ff8a3"
source=("${pkgname}.desktop" ${pkgname})
sha256sums=("cdcfda5e8c79bb762cf10342ecb9c818c919b1b499e857f29bf7ccc0707dc966" "037d5fdf78914310a549a11465ea352eb3e082b4904fac59c0a3e9f5985f2662")

if [[ $CARCH = 'i686' ]]; then
    depends=(sdl gcc-libs bash)
elif [[ $CARCH = 'x86_64' ]]; then
    depends=(lib32-sdl lib32-gcc-libs bash)
fi

build() {
    pkgpath=${startdir}
    msg "You need a full copy of this game in order to install it"
    msg "Searching for \"${_gamepkg}\" in dir: $(readlink -f ${pkgpath})"

    if [[ ! ( -f "${pkgpath}/${_gamepkg}" ) ]]; then
        msg "Game package not found, please type the absolute path to game setup package (/home/joe):"
        read pkgpath
        if [[ ! ( -f "${pkgpath}/${_gamepkg}" ) ]] ; then
           error "Unable to find game package." && return 1
        fi
    fi
    # Check the checksum
    echo "${_gamesum} ${_gamepkg}" > sums
    cp "${pkgpath}/${_gamepkg}" "${srcdir}/"
    if [[ $(sha256sum --quiet -c sums 2> /dev/null) ]]; then
        error "${_gamepkg} FAILED the checksum"
        return 1
    fi
    msg "Found game package, installing..."
    cd $srcdir
    chmod +x $_gamepkg
}

package() {
    cd $srcdir
    ./FS_Linux_Latest.run --mode unattended --prefix ${pkgdir}/opt/${pkgname}
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname}/fs_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 ${srcdir}/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
