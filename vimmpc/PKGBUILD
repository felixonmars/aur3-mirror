# Maintainer: Laszlo Papp <djszapi2 at gmail.com>
pkgname=vimmpc
pkgver=20070410
pkgrel=2
pkgdesc="MPD controller from within Vim"
url="http://gavin.brokentrain.net/projects/vimmpc/"
license=("GPL")
arch=('i686')
source=(http://gavin.brokentrain.net/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz
        http://svn.navi.cx/misc/trunk/python/bemused/mpdclient2.py)
md5sums=('307c35cf91cfdd256ff878c6d6f38fb0'
         'abdd48b3aa487f9d4ad2055a62ced53c')

build() {
    cd ${srcdir}/${pkgname}
    install -d ${pkgdir}/usr/share/vim/plugin/ || return 1
    sed -i 's/function TrackFoldText/function! TrackFoldText/g' $pkgname.vim
    install -Dm 755 $pkgname.{vim,py} ${pkgdir}/usr/share/vim/plugin/ || return 1
}
