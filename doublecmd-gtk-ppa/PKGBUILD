# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)

pkgname=doublecmd-gtk-ppa
_pkgname=${pkgname%-ppa}
pkgver=0.5.4
_pkgver=4505
pkgrel=1
_pkgsuf=M~precise
pkgdesc="Double Commander is a cross platform open source file manager with two panels side by side. It is inspired by Total Commander and features some new ideas."
arch=('i686' 'x86_64')
url='http://doublecmd.sourceforge.net'
# https://launchpad.net/~alexx2000/+archive/doublecmd
depends=('gtk2')
optdepends=('lua: scripting' 'p7zip: support for 7zip archives' 'libunrar: support for rar archives')
provides=('doublecmd' 'doublecmd-ppa')
conflicts=('doublecmd-svn')
replaces=('doublecmd' 'doublecmd-svn')
license=('GPL2')
options=('!strip')

case ${CARCH} in
  i686)
    _bldarch='i386'
    sha1sums=('019e59c17aa24921d2541449886a8adaa5f952cd')
    ;;
  x86_64)
    _bldarch='amd64'
    sha1sums=('ff5ff93a4f5eaa4be781d75a3960b49f55bcb35d')
    ;;
esac

_url=https://launchpad.net/~alexx2000/+archive/doublecmd/+files
source=(${_url}/${_pkgname}_${pkgver}-${_pkgver}${_pkgsuf}_${_bldarch}.deb)

#https://launchpad.net/~alexx2000/+archive/doublecmd/+build/3022534/+files/doublecmd-gtk_0.5.2-4191M~oneiric_i386.deb
build() {
    msg2 "Extracting files..."
    cd "$srcdir"
    ar x ${_pkgname}_${pkgver}-${_pkgver}${_pkgsuf}_${_bldarch}.deb
    tar xf data.tar.gz --exclude lintian -C $pkgdir
}

