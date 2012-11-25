#
pkgname=eureqa
_codename=formulize
pkgver=0.98.1
pkgrel=1
pkgdesc="Tool for detecting equations and hidden mathematical relationships in data."
arch=('i686' 'x86_64')
license=('custom')
url="http://creativemachines.cornell.edu/eureqa"
depends=('libxext' 'fontconfig' 'libxrender' 'glib2' 'libsm') 


if [ "$CARCH" = "i686" ]; then
    _arch='x86-32'
    sha1sums=('65491ded7dcaa329d8dba5f91e350a6adfbb07ff')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86-64'
    sha1sums=('ecd890bf69bf3c19a452afca8fd47cbee1d71b78')
fi

_pkgname=${_codename}_${pkgver//./_}_X11_${_arch}
source=("http://s3.amazonaws.com/${pkgname}/${_pkgname}.tar.gz")

package() {
    msg "Installing"
    install -Dm 755 "${srcdir}/${_pkgname}/${_codename}" "${pkgdir}/usr/bin/${pkgname}"
#   install -Dm 644 "${startdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
