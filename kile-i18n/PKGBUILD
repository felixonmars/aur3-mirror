# Maintainer: Tondu <thomas.gastine at wanadoo.fr>

pkgname=kile-i18n
pkgver=2.1b5
_source_name="kile-lang-2.0.99beta5-34.7.noarch.rpm"
pkgrel=5
pkgdesc="Language packs for kile"
arch=('i686' 'x86_64')
url="http://kile.sourceforge.net"
license=('GPL')
depends=('kile')
makedepends=('rpmextract')
source=("http://download.opensuse.org/repositories/KDE:/Release:/46/openSUSE_11.4/noarch/$_source_name")
md5sums=('ed940adb61cb856963477b2d99e9207b')

build() {
    cd "${pkgdir}"
    rpmextract.sh "${srcdir}/$_source_name" || return 1
}
