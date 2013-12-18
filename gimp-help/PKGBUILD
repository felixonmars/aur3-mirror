# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgbase=gimp-help
pkgname=gimp-help
pkgver=2.8.1
pkgrel=2
pkgdesc='A GIMP help system designed for use with the internal GIMP help browser, external web browser and HTML renderers'
arch=('any')
url='http://docs.gimp.org/'
license=('GPL' 'LGPL')
_languages=(
  'ca     "Catalan"'
  'da     "Danish"'
  'de     "German"'
  'el     "Greek"'
  'en     "English"'
  'en_GB  "English (United Kingdom)"'
  'es     "Spanish"'
  'fr     "French"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ko     "Korean"'
  'nl     "Dutch"'
  'nn     "Norwegian "'
  'pt_BR  "Brazilian Portuguese"'
  'ru     "Russian"'
  'sl     "Slovenian"'
  'sv     "Swedish"'
  'zh_CN  "Chinese (simplified)"'
)
makedepends=(pngnq pngcrush python2)
# AUR workaround
true && pkgname=()
options=(!strip !zipman)
source=("ftp://ftp.gimp.org/pub/gimp/help/gimp-help-${pkgver}.tar.bz2")
for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=gimp-help-${_locale,,}

  pkgname+=($_pkgname)
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

_package() {
  pkgdesc="$2 Gimp Help"
  install -dm755 "$pkgdir"/usr/share/gimp/2.0/help/$1
  cp -rL "$srcdir"/$pkgbase-$pkgver/html/$1 \
    "$pkgdir"/usr/share/gimp/2.0/help
}
build(){
  cd "$srcdir"/$pkgbase-$pkgver
  sed -e 's/env python$/env python2/' -i tools/xml2po.py

  ./configure --prefix=/usr --without-gimp
  make
}
md5sums=('7f48c64bcadab9611ce8d3d89d990bb4')
