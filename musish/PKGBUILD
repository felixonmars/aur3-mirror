# Maintainer: Pierre Neidhardt <ambrevar at gmail dot com>

_pkgname=musish
_arcdir=ambrevar-musish-cf0e4751a170
pkgname=${_pkgname}
pkgver=1.5
pkgrel=1
pkgdesc="A dynamic and extensible music library organizer"
url="http://bitbucket.org/ambrevar/$_pkgname/"
arch=('any')
license=('MIT')
conflicts=('musish-dash' 'musish-git')
depends=('ffmpeg')
optdepends=('jshon' 'cuetools')
source=(https://bitbucket.org/ambrevar/$_pkgname/get/v${pkgver}.tar.bz2)
install="$_pkgname.install"
sha1sums=('26f1ade1c566adb6b56442700de4ee84c6944ad3')

package() {
    cd "${srcdir}/${_arcdir}"
    install -D -m755 musish "${pkgdir}/usr/bin/musish"
    install -D -m755 titlecase "${pkgdir}/usr/bin/titlecase"
    install -D -m644 musishrc "${pkgdir}/etc/xdg/musish/musishrc"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    for i in scripts/*; do
        install -D -m755 "$i" "${pkgdir}/usr/share/${_pkgname}/$i"
    done

    ## Man page
    install -D -m755 -d "${pkgdir}/usr/share/man/man1/"
    gzip -c musish.1 > "${pkgdir}/usr/share/man/man1/musish.1.gz" && chmod 644 "${pkgdir}/usr/share/man/man1/musish.1.gz"
}
