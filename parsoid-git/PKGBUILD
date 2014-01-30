# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=parsoid-git
_pkgname=parsoid
pkgver=ddb6c14
pkgrel=1
pkgdesc="A bidirectional wikitext parser and runtime"
arch=('any')
url="https://www.mediawiki.org/wiki/Parsoid"
license=('GPL2')
depends=('nodejs')
optdepends=(
    'mediawiki: MediaWiki engine'
)
conflicts=('parsoid')
replaces=('parsoid')
provides=('parsoid')
backup=(usr/share/parsoid/api/localsettings.json)
source=("git+https://gerrit.wikimedia.org/r/p/mediawiki/services/parsoid"
        "parsoid.service")
sha512sums=("SKIP"
            "b3c126bc471f6a8fd16fe5c446c2abe657c9e472187b7db0172d9de35cabed36dafc3d648cc410395d9b380f63507f369d95755e3026dce3f873ae42121f8885")
options=('!strip')

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  git describe --always | sed 's|-|.|g'
}

build() {
    cd $srcdir/parsoid
    npm install
}

package() {
    cd $srcdir/parsoid
    mkdir -p "${pkgdir}/usr/share/webapps/${_pkgname}"
    cp -r . "${pkgdir}/usr/share/webapps/${_pkgname}/"
    install -Dm644 "${srcdir}/parsoid.service" "${pkgdir}/usr/lib/systemd/system/parsoid.service"
    install -D "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
