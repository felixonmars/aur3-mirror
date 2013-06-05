# Maintainer: Jove Yu <yushijun110[AT]gmail.com>

pkgname=fcitx-skin-sogou
pkgver=0.0.3
pkgrel=1
pkgdesc="Fcitx skin for for Sogou Pinyin,thinks to sougou"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('custom')
depends=('fcitx>=4.2.6')
source=("http://packages.linuxdeepin.com/deepin/pool/main/f/fcitx-skins/fcitx-skin-sogou_${pkgver}_all.deb")
md5sums=('24a936752eedce4b7433de4a061ecb78')

build(){
  tar xzvf ${srcdir}/data.tar.gz -C ${pkgdir}/
  rm -rf ${pkgdir}/usr/share/doc
}


