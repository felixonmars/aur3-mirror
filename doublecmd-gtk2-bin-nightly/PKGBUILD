# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)

pkgname=doublecmd-gtk2-bin-nightly
_pkgname=doublecmd
pkgver=0.7.0.svn.r6128
_pkgver=0.7.0~0+svn6128
pkgrel=1
pkgdesc="Double Commander is a cross platform open source file manager with two panels side by side. It is inspired by Total Commander and features some new ideas."
arch=('i686' 'x86_64')
url='http://doublecmd.sourceforge.net'
# https://launchpad.net/~alexx2000/+archive/doublecmd-svn
depends=('gtk2')
optdepends=('lua: scripting' 'p7zip: support for 7zip archives' 'libunrar: support for rar archives'
            'pmount: mount removable devices' 'imagemagick: speed up thumbnail view')
install="doublecmd.install"
provides=('doublecmd')
conflicts=('doublecmd-gtk2' 'doublecmd-svn')
license=('GPL2')
options=('!strip')

_bldarch=amd64
[[ $CARCH = i686 ]] && _bldarch=i386

_url=http://download.opensuse.org/repositories/home:/Alexx2000:/doublecmd-svn/xUbuntu_15.04
source=(${_url}/all/${_pkgname}-common_${_pkgver}_all.deb)
source_i686+=(${_url}/i386/${_pkgname}-gtk_${_pkgver}_i386.deb
        ${_url}/i386/${_pkgname}-plugins_${_pkgver}_i386.deb)
source_x86_64+=(${_url}/amd64/${_pkgname}-gtk_${_pkgver}_amd64.deb
        ${_url}/amd64/${_pkgname}-plugins_${_pkgver}_amd64.deb)
sha256sums=('0d157d390af8eee35b17ac62d9c22d0bd546094e4d17f2d3b46fb94827075291')
sha256sums_i686=('2e9d4708c2033d7bd091a13b9677cb5b7ce7d8bb24a03bec6273bec82f9ba108'
                 'da403548260935748a9bf8e70bfcb1c92d943bb7d051c2af185d56351e52c49b')
sha256sums_x86_64=('b9e2596b4170a07cc1f373be5bf4282fae388d9f1aa7e2bd492837d858039564'
                   'e8ad6e8006f70d58117e976966278765913e1769a478666ba372faa8c0f99f81')

package() {
    msg2 "Extracting files..."
    cd "$srcdir"
    ar x ${_pkgname}-gtk_${_pkgver}_${_bldarch}.deb
    tar xf data.tar.xz --exclude lintian -C $pkgdir
    rm -f data.tar.xz
    ar x ${_pkgname}-plugins_${_pkgver}_${_bldarch}.deb
    tar xf data.tar.xz --exclude lintian -C $pkgdir
    rm -f data.tar.xz
    ar x ${_pkgname}-common_${_pkgver}_all.deb
    tar xf data.tar.xz --exclude lintian -C $pkgdir
    rm -f data.tar.xz

}

