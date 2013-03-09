# Contributor: Nathan "IngCr3at1on" Bass (sblood86 AT gmail.com)
# Maintainer: ProjectOpenCannibal

pkgname=ubuntu-nexus7-installer
_pkgname=${pkgname}
_pkgver=.7~
_pkgpre=1
_pkgsuf=p
pkgver=1.7
pkgrel=1
pkgdesc="Ubuntu on Nexus 7 installer"
arch=('any')
url=https://launchpad.net/ubuntu-nexus7
license=('GPL-3')
depends=('zenity' 'wget' 'android-sdk-platform-tools' 'gksu')
provides=("${_pkgname}")

case "$CARCH" in
    any|i686|x86_64)
	_bldarch='all'
	md5sums=('74cabcd216ddfdc286a21020729be546');;
    # The following should not happen; provided you're using 'makepkg' ;)
    *) error "Unknown or invalid CARCH=$CARCH"; exit 1
esac

_url=http://ppa.launchpad.net/ubuntu-nexus7/ubuntu-nexus7-installer/ubuntu/pool/main/u
source=(${_url}/${pkgname}/${pkgname}_${_pkgpre}${_pkgver}${_pkgsuf}_all.deb)

build() {
    msg2 "Extracting files..."
    cd "$srcdir"
    ar x ${_pkgname}_${_pkgpre}${_pkgver}${_pkgsuf}_all.deb
    tar -zxvf data.tar.gz -C $pkgdir
    msg2 "Making it nice..."
    mkdir -p $pkgdir/usr/share/licenses/${pkgname}
    ln -s /usr/share/doc/${_pkgname}/copyright $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

