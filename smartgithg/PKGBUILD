#Maintainer: Alexey Stukalov <astukalov@gmail.com>
pkgname=smartgithg
pkgver=6.0.7
pkgrel=2
pkgdesc="Git/Hg GUI client written in Java."
arch=("any")
url="http://www.syntevo.com/smartgit"
license=('custom')
depends=("java-runtime" "desktop-file-utils" "sh" "git" "gtk2")
optdepends=("mercurial: hg repositiories support")
# package version as it appears in the name of tar.gz archive file
_pkgver=${pkgver//\./_}
# folder within tar.gz archive
_pkgfolder="$pkgname-$_pkgver"
source=(https://www.syntevo.com/download/${pkgname}/${pkgname}-generic-${_pkgver}.tar.gz
        smartgithg.desktop)
install="smartgithg.install"
md5sums=('62ffed6670bed5cc18ebf37bcf520265'
         '0f97479d9fcd4f222cf3ee2ff6cdf3c7')

package() {
    cd "$srcdir"

    #install -D -m644 "${_pkgfolder}"/licenses/* "${pkgdir}/usr/share/licenses/${pkgname}"
    mkdir -p "${pkgdir}"/opt
    mv "${_pkgfolder}" ${pkgdir}/opt/${pkgname} || return 1

    install -D -m644 smartgithg.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop

    # create link in /usr/bin
    cd ${pkgdir}
    chmod 755 opt/${pkgname}/bin/smartgithg.sh
    mkdir -p usr/bin
    ln -s /opt/${pkgname}/bin/smartgithg.sh usr/bin/${pkgname}
}
