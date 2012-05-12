# Contributor: jose <jose1711 [at] gmail (dot) com>
# Maintainer:  Mario De Weerd <bt747@bt747.org>
pkgname=bt747_dev
pkgver=2.1.4
pkgrel=1
pkgdesc="datalogger device control for mtk-chipset based loggers"
arch=('i686' 'x86_64')
url="http://www.bt747.org/"
license=("GPL-3")
depends=('java-runtime' 'xorg-fonts-type1')
install=bt747.install
options=('!strip')
source=("http://downloads.sourceforge.net/project/bt747/Development/BT747_2.1.4_full.zip" "http://soft.bt747.org/icon/BT747_icon48x48x8.gif" "bt747.desktop")
md5sums=('17a1eca798a14c8e4bf4f3ec104b42af'
		 'ad4f7947ba2f9471a9e24f299d80a6a4'
         '9bcc29d20ca24b85ae074573e5bd774c')
build() {
echo
}
_installdir="/usr/share/java/bt747"
_bindir="/usr/bin"

package() {
	mkdir -p ${pkgdir}/${_bindir}
	mkdir -p ${pkgdir}/${_installdir}
	/bin/sed -i '/ROOT_DIR=/s%.*%ROOT_DIR='${_installdir}'%' run_j2se.sh
	chmod 644 lib/*.jar dist/*.jar
	/bin/tar cf - --exclude=*.exe --exclude=*.bat --exclude=src* * | ( cd ${pkgdir}/${_installdir} ; tar xfp - )
#	ln -sf ${pkgdir}/${_installdir}/run_j2se.sh ${pkgdir}/${_bindir}/bt747
	ln -sf ../../${_installdir}/run_j2se.sh ${pkgdir}/${_bindir}/bt747
	
	install -d -m 0755 "${pkgdir}/usr/"{share/applications,share/pixmaps}
	install -D -m644 $srcdir/bt747.desktop ${pkgdir}/usr/share/applications/bt747.desktop
	install -D -m644 $srcdir/BT747_icon48x48x8.gif "${pkgdir}/usr/share/pixmaps/bt747.png"
}
