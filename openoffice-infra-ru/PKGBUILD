# Contributor: f0x@f0x.ru
# update pkgbuild: renya renya.vad@ya.ru
pkgname=openoffice-infra-ru
pkgver=3.2.1
pkgrel=1
pkgdesc="OpenOffice.org russian build from infraresource (binary, w/o JRE)"
arch=('i686' 'x86_64')
url="http://i-rs.ru/"
license=('GPL')
depends=(startup-notification libx11 libxau libice libsm freetype2 zlib libxdmcp libxext java-runtime)
makedepends=(rpmextract)
conflicts=(go-openoffice openoffice-base openoffice-spell-ru openoffice-lang-ru openoffice.org3-infra-ru)
replaces=(go-openoffice openoffice-base openoffice-spell-ru openoffice-lang-ru openoffice.org3-infra-ru)
backup=(opt/openoffice/share/dict/ooo/dictionary.lst)
install=openoffice.install
_source_arch="x86"
[ "$CARCH" = "x86_64" ] && _source_arch="x86-64"
source=(http://download.i-rs.ru/pub/openoffice/${pkgver}/ru/OOo_${pkgver}_Linux_${_source_arch}_install-rpm_ru_infra.tar.gz
	http://ivanmez.googlepages.com/openoffice.org-menus-3.0.tar.gz
	http://www.languagetool.org/download/LanguageTool-0.9.9.oxt
        template.desktop)
md5sums=('41dd5164ecf3c31b11d10ab8deed6ba8' 'abac019e2027d428d69241f55c48b78b' '6613391224d576fa1551d2634ac2933d' '9fb970fb10a1b59308f5d2df3777a0bf')
[ "$CARCH" = "x86_64" ] && md5sums=('1633e776948d6c39bdbfbadffcc906b0' 'abac019e2027d428d69241f55c48b78b' '6613391224d576fa1551d2634ac2933d' '9fb970fb10a1b59308f5d2df3777a0bf')
build() {
  cd $srcdir/
   for _i in $(ls ru/RPMS/*.rpm); do
    echo Extracting: $_i
    rpmextract.sh $_i
   done
  mv ./opt $pkgdir/ && \
  mv ./usr $pkgdir/ && \
  install -D -m0644 ../template.desktop $pkgdir/usr/share/applications/OOo.desktop
  install -D -m0644 ../LanguageTool-0.9.9.oxt $pkgdir/opt/openoffice.org3/share/extension/install/LanguageTool-0.9.9.oxt
}
