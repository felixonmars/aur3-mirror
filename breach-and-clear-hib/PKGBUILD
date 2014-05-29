# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
pkgname=breach-and-clear-hib
pkgver=20140528
pkgrel=1
pkgdesc='A hybrid tactical strategy game based on real-life special operations forces'
arch=('i686' 'x86_64')
url='http://www.breachandclear.com/'
license=('custom:commercial')
depends=('glu' 'mesa' 'libxcursor')
[[ "${CARCH}" == 'x86_64' ]] && depends+=('lib32-glu' 'lib32-mesa' 'lib32-libxcursor')
source=('hib://breachandclear_nix.tgz'
        'breach-and-clear.desktop')
md5sums=('1af957ed95f9cb6b8c677dccaec0b60f'
         '8732282156a43d5fc68c779922e15a6f')

#prepare () {
#    ln -s "${startdir}/DontMove_v1-2_linux.tar.gz" "${srcdir}/dontmove.tar.gz"
#}

package () {
    cd "${srcdir}/nix"
    _installdir="/opt/breach-and-clear"
    install -d -m755 "${pkgdir}"/{usr/bin,"${_installdir}"}
    install -m755 bnc_linux.x86 "${pkgdir}/${_installdir}/"

    ln -s "/${_installdir}/bnc_linux.x86" "${pkgdir}/usr/bin/breach-and-clear"
    cp -a --no-preserve=ownership "bnc_linux_Data" "${pkgdir}/${_installdir}/"

    install -Dm644 bnc_linux_Data/Resources/UnityPlayer.png "${pkgdir}/usr/share/pixmaps/breach-and-clear.png"
    install -Dm644 "${srcdir}/breach-and-clear.desktop" "${pkgdir}/usr/share/applications/breach-and-clear.desktop"
}
