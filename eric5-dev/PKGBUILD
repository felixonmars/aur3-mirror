# Contributor: André Vitor de Lima Matos <http://www.google.com/profiles/andre.vmatos>

pkgname=eric5-dev
pkgver=1237
pkgrel=1
#pkgrel=1
#_pkgver="eric5-${pkgver}-snapshot-${pkgrel}"
#_pkgver="eric5"
pkgdesc="A full-featured Python IDE that is written in PyQt4 using the QScintilla2 editor widget (HG release)."
_src_url='http://downloads.sourceforge.net/eric-ide'
arch=('any')
url='http://eric-ide.python-projects.org/index.html'
license=('GPL3')
depends=('python>=3.1' 'python-qscintilla' 'python-qt')
makedepends=('mercurial')
conflicts=('eric5')
provides=('eric')
source=()
md5sums=()

_hgroot=('http://die-offenbachs.homelinux.org/hg/')
_hgrepo=('eric5/')

build() {
    cd "${srcdir}/${_hgrepo}"

    python install.py -c -b "/usr/bin" -i "${pkgdir}" || return 1
}

