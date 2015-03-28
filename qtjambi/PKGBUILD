# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Contributor: Ferrazzo Riccardo <f.riccardo87@gmail.com>
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/qtjambi/PKGBUILD

pkgname=qtjambi
pkgver=4.8.6.1
pkgrel=1
arch=('i686' 'x86_64')
_os='linux'
pkgdesc="The Qt library made available to Java."
url="http://qt-jambi.org/"
license=('LGPLv3')
depends=('java-environment' 'libpng12')
conflicts=('qtjambi-beta')
replaces=('qtjambi-beta')
sha1sums=('8a60c443ff4739d3376926d2d453580b1ff464d3')

# 'unofficial' but linked on http://qtjambi.org/downloads
# http://unofficial.qt-jambi.org/qtjambi-4.8.6.1-linux64.tar.xz
source=("http://unofficial.qt-jambi.org/${pkgname}-${pkgver}-${_os}64.tar.xz")
_src_prefix="${pkgname}-${pkgver}-${_os}64"

if [ "$CARCH" = 'i686' ]; then
  _arch='32'
  pkgver=4.6.3
  sha1sums[0]='2665b0928bf9890b3fc64d83e93a6608bbf292be'
  _src_prefix="${pkgname}/${pkgname}-${_os}${_arch}-community-${pkgver}"
  source=("http://downloads.sourceforge.net/${_src_prefix}.tar.gz")
fi

package() {
  install -d ${pkgdir}/opt/${pkgname}
  install -d "${pkgdir}/usr/share/java/${pkgname}"
  pushd "$_src_prefix"
	cp -ar ./ "${pkgdir}/opt/${pkgname}"

	cd ${pkgdir}/opt/${pkgname}
	for j in *.jar; do
	  msg "linking $j"
	  pushd "${pkgdir}/usr/share/java/${pkgname}"
      	ln -s "/opt/${pkgname}/$j" ./"$j"
      popd
  	done
  popd
}
