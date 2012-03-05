# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

[ $CARCH = "x86_64" ] && _arch=-x86_64
_eclipse_name=indigo
_eclipse_release=SR2
_eclipse_timestamp=201106131736

pkgname=eclipse-jee-birt
pkgver=3.7.2
pkgrel=2
pkgdesc="Eclipse IDE for Java EE Developers"
arch=('i686' 'x86_64')
url="http://www.eclipse.org"
license=('EPL')
depends=('java-environment>=6' 'gtk2>=2.16.1' 'xulrunner>=1.9.0.10')
makedepends=('unzip' 'patch')
provides=('eclipse')
conflicts=('eclipse' 'eclipse-jee')
install=${pkgname}.install
source=(eclipse.sh eclipse.desktop eclipse.ini.patch eclipse.svg
		http://ftp.halifax.rwth-aachen.de/eclipse/technology/epp/downloads/release/${_eclipse_name}/${_eclipse_release}/eclipse-jee-${_eclipse_name}-${_eclipse_release}-linux-gtk${_arch}.tar.gz
        http://mirrors.ibiblio.org/pub/mirrors/eclipse/birt/downloads/drops/S-R1-3_7_2-S20120214-201202141408/birt-report-framework-3_7_2-S20120214.zip)
changelog=${pkgname}.ChangeLog.markdown

md5sums=('00598e0866353f7a7b1a5ed65dc01610'
         '0537090ceeb11a2af66676481e8cf797'
         '95cd5f9fb766ab4b4f9f4f1802d7a385'
         '5e9975a49de88815a731cbd4c77a136e'
         '9aa26403a82436a9170e73ae243fbd76'
         '0749214b43a89d92c358d41789b9ff87')
sha256sums=('4cca2873697a3af39a96449021d7fdc2fc2b01abc9f7883946081f6be7a5ed48'
            '4eb2189c96fcfa340886b049b34dc3636d7b2bfa865140dc72edb61455d900c3'
            'fee0685e9341912144bf15c270f518fc965d975728906bd03a3fabbc8ecc685c'
            '6fe3ab198af244f9c8c2463b6837855506e811f61e5fd8ac7c9d5fe348830a14'
            '3a312b0ade97a1efdb0bb5cf97921ccde9e54a19f041b65997bd82a79c659c44'
            '6d2ca5a7283f91b4639f637495f97f09536ca8e48ff70c8dc8cee4479fcdee12')

[ "$CARCH" = "x86_64" ] && md5sums[4]='a75089028a10e5140bf18ca0b83a3041'
[ "$CARCH" = "x86_64" ] && sha256sums[4]='552df575d980929e007527f7f2563b85e9c8c9e92349646f4524e9e3a06c4027'

package() {
	local _icon_path=/usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}.v${_eclipse_timestamp}

	install -m755 -d $pkgdir/usr/{bin,share/applications}
	install -m755 -d $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,scalable}/apps

	cd $srcdir

	patch -p1 < eclipse.ini.patch

	mv eclipse $pkgdir/usr/share
	install -D -m 755 eclipse.sh $pkgdir/usr/bin/eclipse
	install -D -m 644 eclipse.desktop $pkgdir/usr/share/applications
	install -D -m 644 eclipse.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/eclipse.svg
	ln -s ${_icon_path}/eclipse.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/eclipse.png
	ln -s ${_icon_path}/eclipse32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/eclipse.png
	ln -s ${_icon_path}/eclipse48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/eclipse.png
}
