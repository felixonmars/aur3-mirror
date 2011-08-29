# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)


pkgname=doublecmd-help-ru-ppa
_pkgname=${pkgname%-ppa}
pkgver=3858
_pkgver=3858
_pkgpre=0.5.0
pkgrel=1
_pkgsuf=M~ppa_all
pkgdesc="Documentation for the Double Commander (Russian)"
arch=('any')
url='http://doublecmd.sourceforge.net'
# https://launchpad.net/~alexx2000/+archive/doublecmd
depends=('doublecmd-ppa' 'xdg-utils')
license=('GPL2')
options=('!strip')

#https://launchpad.net/~alexx2000/+archive/doublecmd/+files/doublecmd-help-ru_0.4.6-3715M~ppa_all.deb

_url=https://launchpad.net/~alexx2000/+archive/doublecmd/+files
source=(${_url}/${_pkgname}_${_pkgpre}-${_pkgver}${_pkgsuf}.deb)
md5sums=('620acc124c7f08a1ad3df2205ee6291e')

build() {
    msg2 "Extracting files..."
    cd "$srcdir"
    ar x ${_pkgname}_${_pkgpre}-${_pkgver}${_pkgsuf}.deb
    tar xf data.tar.gz --exclude lintian -C $pkgdir
}
