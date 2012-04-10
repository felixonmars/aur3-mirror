# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)


pkgname=doublecmd-qt-ppa
_pkgname=${pkgname%-ppa}
pkgver=0.5.4
_pkgver=4505
pkgrel=1
#_pkgsuf=M~natty
#_pkgsuf=M~oneiric
_pkgsuf=M~precise
pkgdesc="Double Commander is a cross platform open source file manager with two panels side by side. It is inspired by Total Commander and features some new ideas."
arch=('i686' 'x86_64')
url='http://doublecmd.sourceforge.net'
# https://launchpad.net/~alexx2000/+archive/doublecmd
depends=('qt' 'qt4pas')
optdepends=('lua: scripting' 'p7zip: support for 7zip archives' 'libunrar: support for rar archives')
provides=('doublecmd' 'doublecmd-ppa')
conflicts=('doublecmd-svn' 'doublecmd-gtk-ppa')
replaces=('doublecmd' 'doublecmd-svn' 'doublecmd-gtk-ppa')
license=('GPL2')
options=('!strip')

case ${CARCH} in
  i686)
    _bldarch='i386'
    sha1sums=('a045dbc639fa0d51e6fdf0d2980d38a30bdb66d3')
    ;;
  x86_64)
    _bldarch='amd64'
    sha1sums=('7731347b6329220eb654de114ede38dd40cad675')
    ;;
esac

_url=https://launchpad.net/~alexx2000/+archive/doublecmd/+files
source=(${_url}/${_pkgname}_${pkgver}-${_pkgver}${_pkgsuf}_${_bldarch}.deb)


build() {
    msg2 "Extracting files..."
    cd "$srcdir"
    ar x ${_pkgname}_${pkgver}-${_pkgver}${_pkgsuf}_${_bldarch}.deb
    tar xf data.tar.gz --exclude lintian -C $pkgdir
}
