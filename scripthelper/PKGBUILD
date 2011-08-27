# Contributor: max-k <max-k@post.com>

pkgname="scripthelper"
_pkgname="ScriptHelper"
pkgver="0.2.beta"
pkgrel=1
pkgdesc="Shell libraries to help writting shell script"
arch=(i686 x86_64)
url="https://github.com/Tauop/ScriptHelper"
license=('GPLv2')
depends=()
optdepends=()
conflicts=()

source=("https://github.com/downloads/Tauop/${_pkgname}/${_pkgname}-v${pkgver}.tar.gz")

md5sums=('ca3b39603ad2f0343ce815e43b42d58b')

build() {
cd ${startdir}/src/${_pkgname}
install -D -m 644 COPYING ${startdir}/pkg/usr/share/doc/${pkgname}/COPYING
install -D -m 644 README ${startdir}/pkg/usr/share/doc/${pkgname}/README
mkdir -p ${startdir}/pkg/usr/lib/${pkgname}
install -D -m 644 *.lib.sh ${startdir}/pkg/usr/lib/${pkgname}/
install -D -m 644 ${_pkgname}.conf ${startdir}/pkg/etc/${_pkgname}.conf
}