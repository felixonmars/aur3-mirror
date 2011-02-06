# Contributor: portix <portix@gmx.net>

pkgname=tairu-hg
_realname=tairu
pkgver=28
pkgrel=1
pkgdesc="Simple bash script that brings tiling to EWMH-compliant window managers"
url="http://bitbucket.org/portix/tairu"
arch=(any)
license=('GPL')
depends=('wmctrl')
makedepends=('mercurial')

_hgroot="https://bitbucket.org/portix"
_hgrepo="tairu"

build() {
    cd ${srcdir}/${_hgrepo}
    ./build.sh || return 1
    PREFIX=${pkgdir}/usr/bin ./build.sh install || return 1
}
