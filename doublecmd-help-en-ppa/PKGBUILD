# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)


pkgname=doublecmd-help-en-ppa
_pkgname=${pkgname%-ppa}
pkgver=3858
_pkgver=3858
_pkgpre=0.5.0
pkgrel=1
_pkgsuf=M~ppa_all
pkgdesc="Documentation for the Double Commander (English)"
arch=('any')
url='http://doublecmd.sourceforge.net'
# https://launchpad.net/~alexx2000/+archive/doublecmd
depends=('doublecmd-ppa' 'xdg-utils')
license=('GPL2')
options=('!strip')

#https://launchpad.net/~alexx2000/+archive/doublecmd/+files/doublecmd-help-en_0.4.6-3715M~ppa_all.deb

_url=https://launchpad.net/~alexx2000/+archive/doublecmd/+files
source=(${_url}/${_pkgname}_${_pkgpre}-${_pkgver}${_pkgsuf}.deb)
md5sums=('e4a6d9e8b7cbe4efb496e04190d2fbf0')


build() {
    msg2 "Extracting files..."
    cd "$srcdir"
    ar x ${_pkgname}_${_pkgpre}-${_pkgver}${_pkgsuf}.deb
    tar xf data.tar.gz --exclude lintian -C $pkgdir
}
