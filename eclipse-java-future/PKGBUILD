# $Id$
# Maintainer: Chris Fordham <chris [at] fordham [hyphon] nagy [dot] id [dot] au> aka flaccid
# Package Build Source: https://github.com/flaccid/archlinux-packages/blob/master/eclipse-java-future/PKGBUILD

_eclipse_name=mars
_eclipse_release=M6
_eclipse_timestamp=201202080800

# releases:
# http://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release/release.xml

# mirror path:
# /technology/epp/downloads/release/mars/M3/eclipse-java-mars-M3-linux-gtk-x86_64.tar.gz

pkgname=eclipse-java-future
_pkgname=eclipse-java
pkgver="4.5.0$_eclipse_release"
pkgrel=2
pkgdesc="Eclipse IDE for Java Developers (future release: $_eclipse_release)."
arch=('i686' 'x86_64')
url="http://www.eclipse.org"
license=("EPL")
depends=('java-environment>=6' 'gtk3' 'xulrunner>=1.9.0.10')
makedepends=('unzip' 'patch')
provides=('eclipse')
conflicts=('eclipse' 'eclipse-java')
replaces=('eclipse' 'eclipse-java')
changelog=${pkgname}.ChangeLog.markdown
install=${_pkgname}.install

source=(
  http://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release/${_eclipse_name}/${_eclipse_release}/eclipse-java-${_eclipse_name}-${_eclipse_release}-linux-gtk-x86_64.tar.gz
  eclipse-java.sh
  eclipse-java.desktop
  eclipse-java.svg
)

sha256sums=('b6a36192eb43b930687a14c931ec6e89e6fbb8b399b9360a72ea9d490d8219a9'
            '6dcb02c5282ea11e661f2dfda95193b1622b0703b10fe14a6a6ab76e9bf3a5bf'
            '6412e9d0f870531dcf1bce374d00eb4e0ad3c85220e06eff6996c544ab67e176'
            '6fe3ab198af244f9c8c2463b6837855506e811f61e5fd8ac7c9d5fe348830a14')

# override source for 32-bit
[ "$CARCH" = "i686" ] && source[0]="http://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release/${_eclipse_name}/${_eclipse_release}/eclipse-java-${_eclipse_name}-${_eclipse_release}-linux-gtk.tar.gz"
[ "$CARCH" = "i686" ] && sha256sums[0]='e91e8bd3f256b21f9ff11079479120e04b35b28695094ae4ebf0a0adcbc3d662'

package() {
	local _icon_path=/usr/share/eclipse-java/plugins/org.eclipse.platform_${pkgver}.v${_eclipse_timestamp}

	install -m755 -d $pkgdir/usr/{bin,share/applications}
	install -m755 -d $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,scalable}/apps

 	cd "$srcdir"
  	mv eclipse "$pkgdir/usr/share/eclipse-java"

	install -D -m755 eclipse-java.sh $pkgdir/usr/bin/eclipse-java
	install -D -m644 eclipse-java.desktop $pkgdir/usr/share/applications
	install -D -m644 eclipse-java.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/eclipse-java.svg

  ln -s ${_icon_path}/eclipse.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/eclipse-java.png
	ln -s ${_icon_path}/eclipse32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/eclipse-java.png
	ln -s ${_icon_path}/eclipse48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/eclipse-java.png
}

# vim:set ts= 2 sw=2 et:
