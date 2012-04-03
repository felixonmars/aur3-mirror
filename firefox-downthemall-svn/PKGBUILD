# Maintainer: cuihao <cuihao dot leo at gmail dot com>

pkgname=firefox-downthemall-svn
pkgver=3061
pkgrel=1
pkgdesc="A plugin adding new advanced download capabilities to firefox (SVN developing version)"
arch=('any')
url="http://www.downthemall.net/"
license=('GPL2' 'LGPL2.1' 'MPL' 'CCPL:cc-by-sa-3.0' 'custom')
depends=("firefox")
conflicts=("firefox-downthemall")
provides=("firefox-downthemall")
makedepends=('unzip' 'subversion')

_svntrunk="https://code.downthemall.net/repos/trunk/"
_svnmod="downthemall"

_detect_ff_vers() {
    local rdffile=$1
    local emid='{ec8030f7-c20a-464f-9b0e-13a3a9e97384}'
    local vers=($(python << HERE
from xml.dom import minidom
gc=lambda x:x.getElementsByTagName
gt=lambda x:x.firstChild.data
for m in gc(minidom.parse('$rdffile'))('Description'):
    for n in m.childNodes:
        if n.nodeType==n.ELEMENT_NODE and gt(n)=='$emid':
            print(gt(gc(m)('em:minVersion')[0]),
                  gt(gc(m)('em:maxVersion')[0]).replace('*','9999'))
            exit(0)
HERE
))
    true && depends=("firefox>=${vers[0]}" "firefox<=${vers[1]}")
    return 0
}

build() {
    cd "$srcdir"

    msg "Connecting to SVN server..."
    if [[ -d "$_svnmod/.svn" ]]; then
        (cd $_svnmod && svn up)
    else
        svn co $_svntrunk $_svnmod --config-dir ./
    fi
    msg "SVN checkout done or server timeout."
}

package() {
    cd "$srcdir/$_svnmod"

    _detect_ff_vers install.rdf

    local _insdir="$pkgdir/usr/lib/firefox/extensions/dta@downthemall.net"
    mkdir -p "$_insdir"
    cp -r ./* "$_insdir"
    rm -rf "$_insdir/"{.svn,GPL,LGPL,MPL,LICENSE,tests}
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
