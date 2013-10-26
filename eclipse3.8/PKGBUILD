# Maintainer: Firefgx <firefgx at gmail dot com>
# Contributor: Firefgx <firefgx at gmail dot com>
# Contributor: alex-no1 <sanja dot msg at gmx dot de>

pkgname=eclipse3.8
_realname=eclipse
pkgver=3.8.2
pkgrel=1
_date=201301310800
pkgdesc="An IDE for Java and other languages - 3.8 - simultaneously released with 4.2 Juno."
arch=('i686' 'x86_64')
url="http://www.eclipse.org/"
options=('!strip' 'emptydirs')
license=('EPL')
depends=('java-environment'
		 'gtk2'
		 'unzip'
		 'webkitgtk2'
		 'libxtst')
provides=('eclipse=3.8.2')
conflicts=('xulrunner'
		   'eclipse'
		   'eclipse-38'
		   'eclipse-382')
install=${_realname}.install
source=("http://archive.eclipse.org/eclipse/downloads/drops/R-${pkgver}-${_date}/${_realname}-SDK-${pkgver}-linux-gtk.tar.gz"
        "${_realname}.desktop"
		"${_realname}.svg"
        "${_realname}.sh")
md5sums=('1f640578cd89202b6ab20533750ed9ba'
         'ba2cf02c48e6e35bfe3685401c26bb5b'
		 '77cff7543ccf7e177cb6667f5a20ce19'
         '7ea99a30fbaf06ec29261541b8eb1e23')
[ "${CARCH}" = "x86_64" ] && source[0]="http://archive.eclipse.org/eclipse/downloads/drops/R-${pkgver}-${_date}/${_realname}-SDK-${pkgver}-linux-gtk-${CARCH}.tar.gz"
[ "${CARCH}" = "x86_64" ] && md5sums[0]='da92b83689eef485e39d39e62d57a8d0'

package() {

  cd "${srcdir}/eclipse"

  # Patch to increase default memory limits
  sed -i "s/^-Xmx.+m$/-Xmx640m/" ${_realname}.ini

  # Python2 fix
  sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|' \
    plugins/org.apache.ant_1.8.3.v201301120609/bin/runant.py

  # Install bin file
  install -d -m755 ${pkgdir}/usr/bin
  install -m755 ${srcdir}/${_realname}.sh ${pkgdir}/usr/bin/${_realname}

  # Install icon and desktop files
  install -d -m755 ${pkgdir}/usr/share/applications
  install -m644 ${srcdir}/${_realname}.desktop ${pkgdir}/usr/share/applications/

  install -d -m755 ${pkgdir}/usr/share/icons/hicolor/{16x16,32x32,48x48,256x256,scalable}/apps
  for i in 16 32 48 256; do
	  install -m644 plugins/org.eclipse.sdk_${pkgver}.v${_date}/${_realname}${i}.png \
		${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_realname}.png
  done
  install -m644 ${srcdir}/eclipse.svg \
	${pkgdir}/usr/share/icons/hicolor/scalable/apps/eclipse.svg

  # Move everything
  install -d -m755 ${pkgdir}/usr/share/${_realname}
  mv * ${pkgdir}/usr/share/${_realname}/

}
