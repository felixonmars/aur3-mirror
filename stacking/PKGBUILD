# Maintainer: Kasper Menten <kasper.menten@gmx.com>

pkgname=stacking
_srcpkgname=Stacking
pkgver=20130604
_srcpkgver=2013-06-04
pkgrel=1
pkgdesc='A matryoshka dolls puzzle-adventure (game sold separately)'
arch=('i686' 'x86_64')
url='http://www.stackingvideogame.com/'
license=('custom')
makedepends=('unzip')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-nvidia-libgl' 'lib32-glu' 'lib32-zlib' 'lib32-glibc' 'lib32-gcc-libs'
             'lib32-nvidia-utils' 'lib32-libx11' 'lib32-libxext' 'lib32-libxcb' 'lib32-libxau' 'lib32-libxdmcp')
    optdepends=('lib32-libtxc_dxtn: texture decoding for open source ATI and Intel drivers'
                'lib32-libpulse: needed for sound on systems using pulse')
else
    depends=('nvidia-libgl' 'glu' 'zlib' 'glibc' 'gcc-libs'
             'nvidia-utils' 'libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp')
    optdepends=('libtxc_dxtn: texture decoding for open source ATI and Intel drivers'
                'libpulse: needed for sound on systems using pulse')
fi
options=('!strip')
_gamepkg="${_srcpkgname}-Linux-${_srcpkgver}-setup.bin"
source=("${pkgname}.desktop"
        "hib://${_gamepkg}")
md5sums=('27670b064e249485b7c9a7aef3d59e2e'
         '4194bb869d537d40da7ad7f65b1102ed')
# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; echo "Read this PKGBUILD for more info."; exit 1')
PKGEXT='.pkg.tar'

build(){
    cd "${srcdir}"
    unzip -o "${_gamepkg}" -d "${pkgname}-${pkgver}" || true
}

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"

    mkdir -p "${pkgdir}/opt"
    cp -Rl data "${pkgdir}/opt/${pkgname}"

    install -D -m644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -d "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/Stack.bin.x86" "${pkgdir}/usr/bin/${pkgname}"
}
