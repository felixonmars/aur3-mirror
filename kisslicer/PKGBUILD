# Maintainer: Andrea Cattaneo <andrea.cattaneo.dev@gmail.com>

pkgname=kisslicer
pkgver=1.1.0
pkgrel=3
pkgdesc="program that generates G-code from STL file for 3D Printers"
arch=('i686' 'x86_64')
url='http://kisslicer.com'
license="UNKNOWN"
depends=('gcc-libs-multilib' 'mesa')
makedepends=( 'imagemagick' )
install=kisslicer.install

md5sums=(
    '24e438e1a752b5b2bb8afe88ce489cdc'
    'a8acf661d8dc60f1024d443aa7ef1444'
    '53a22bdaa121fa0e01251464363d07b8'
)

if test "$CARCH" == x86_64; then
    _ARCH="64"
    md5sums+=("14f84a3b450c46b1a4b68cd08e313724")
else
    _ARCH="32"
    md5sums+=("b2060cebd2caa5cd1d14ab3c015b80f1")
fi




source=(
    "KISSlicer.desktop"
    "KISSlicer.png"
    "KISSlicer.sh"
    "kisslicer-${pkgver}.zip::http://kisslicer.com/files/${pkgver//./}/KISSlicer_Linux${_ARCH}_${pkgver//./_}.zip"
)


ICON_DIMS=(
    '512'
    '384'
    '256'
    '192'
    '128'
    '96'
    '72'
    '64'
    '48'
    '40'
    '36'
    '32'
    '24'
    '22'
    '20'
    '16'
)

build() {
    cd $srcdir
    chmod +x KISSlicer
    chmod +x ${source[2]}

    ICON_ORIG=${source[1]}
    for dim in ${ICON_DIMS[@]}; do
        convert "${ICON_ORIG}"   -resize ${dim}x${dim}  "${ICON_ORIG%\.*}-${dim}x${dim}.png"
    done

}

package(){
    cd $pkgdir
    install -d "$pkgdir/usr/bin/"
    install -Dm755 "${srcdir}/KISSlicer" "$pkgdir/usr/bin/${pkgname}.bin"
    install -Dm755 "${srcdir}/${source[2]}" "$pkgdir/usr/bin/${pkgname}"

    ICON_ORIG=${source[1]}
    for dim in ${ICON_DIMS[@]}; do
        install -Dm644 "$srcdir/${ICON_ORIG%\.*}-${dim}x${dim}.png" \
            "$pkgdir/usr/share/icons/hicolor/${dim}x${dim}/apps/${pkgname}.png"
    done

    install -Dm644 "$srcdir/${source[0]}" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}