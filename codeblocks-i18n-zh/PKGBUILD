# Maintainer  : Firef0x <Firefgx {at) gmail [dot} com>
# Contributor : Firef0x <Firefgx {at) gmail [dot} com>

pkgname=codeblocks-i18n-zh
pkgver=13.12.20150501
pkgrel=1
pkgdesc="Chinese language pack for Code::Blocks, an open source and cross-platform C/C++ IDE"
arch=('any')
url="http://www.codeblocks.org"
license=('GPL3')
depends=('codeblocks>=13.12')
source=('_codeblocks-zh_CN.po'
        '_codeblocks-zh_TW.po')
sha256sums=('1e067317283d98695d7a0e5a3f18a09543a753bef1d669c302683d25f7cd7952'
            '562d3632316989d5e4c22a75bceed802e9bd15886cdcb14bb781d41793a0d5f7')

package() {
  install -d ${pkgdir}/usr/share/codeblocks/locale/{zh_CN,zh_TW}
  msgfmt _codeblocks-zh_CN.po -o ${pkgdir}/usr/share/codeblocks/locale/zh_CN/zh_CN.mo
  msgfmt _codeblocks-zh_TW.po -o ${pkgdir}/usr/share/codeblocks/locale/zh_TW/zh_TW.mo
}

# vim:set sts=2 sw=2 ts=2 et:
