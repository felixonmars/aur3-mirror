# Maintainer: Stanislav `Cfr` Serebryakov <cfr.ssv@gmail.com>
# Contributor: Stan `Cfr` Serebryakov <cfr.ssv@gmail.com>, Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=nqw-hg
pkgver=47
pkgrel=1
pkgdesc='Not Quite a Wiki, minimalistic file-based wiki written in Python'
arch=('any')
url='http://bitbucket.org/vlasovskikh/nqw/'
license=('MIT')
depends=('python2' 'django' 'python-markdown' 'python-pygments' 'python-lxml')
makedepends=('setuptools' 'mercurial' 'make')
conflicts=("nqw")
provides=("nqw")

_hgroot="http://bitbucket.org/vlasovskikh"
_hgrepo="nqw"

build() {
    cd "$srcdir/$_hgrepo"
    make DESTDIR=$pkgdir install || return 1
    install -D LICENSE $pkgdir/usr/share/licenses/nqw-hg/COPYING || return 1
}
