# Maintainer: cuihao <cuihao dot leo at gmail dot com>

pkgname=firefox-https-everywhere-git
pkgver=20120403
pkgrel=1
pkgdesc="an addon making firefox auto use HTTPS (git developing version)"
arch=('any')
url="https://www.eff.org/https-everywhere/"
license=('custom:GPL2+')
depends=("firefox")
provides=("firefox-https-everywhere")
makedepends=('unzip' 'git' 'python2-lxml')

_gitname="https-everywhere"
_gitroot="git://git.torproject.org/https-everywhere.git"

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
    cd $srcdir
    msg "Connecting to the GIT server...."
  
    if [ -d $_gitname ]; then
        cd $_gitname && git pull origin && cd ..
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi
    
    msg "GIT checkout done"
    
    rm -rf "$_gitname-build"
    cp -rf "$_gitname" "$_gitname-build"
    cd "$_gitname-build"

    sed -i '1 i#\!/usr/bin/python2' trivial-validate.py
    ./makexpi.sh
}

package() {
    cd "$_gitname-build"

    local _insdir="$pkgdir/usr/lib/firefox/extensions/https-everywhere@eff.org"
    install -d "$_insdir"
    unzip -od "$_insdir" pkg/*.xpi
    _detect_ff_vers "$_insdir/install.rdf"

    install -D -m644 "src/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "$_insdir/LICENSE.txt"
}
