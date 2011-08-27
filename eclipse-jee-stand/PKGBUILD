# Contributor: [Damjan Dimitrioski](mailto:damjandimitrioski at gmail.com)

[ $CARCH = "x86_64" ] && _arch=-x86_64
_package_name=eclipse-jee
_eclipse_name=indigo
_eclipse_release=R
_eclipse_timestamp=201106131736

pkgname=eclipse-jee-stand
pkgver=3.7
pkgrel=1
pkgdesc="Eclipse IDE for Java EE Developers, Standalone package"
arch=('i686' 'x86_64')
url="http://www.eclipse.org"
license=('EPL')
depends=('java-environment>=6' 'gtk2>=2.16.1' 'xulrunner>=1.9.0.10')
makedepends=('unzip' 'patch')
provides=('eclipse-jee')
install=${_package_name}.install
source=(http://ftp.halifax.rwth-aachen.de/eclipse/technology/epp/downloads/release/${_eclipse_name}/${_eclipse_release}/${_package_name}-${_eclipse_name}-linux-gtk${_arch}.tar.gz
eclipse.sh eclipse.desktop eclipse.ini.patch eclipse.desktop.patch eclipse.sh.patch)

# These hashes are taken from the ftp.halifax:  
#md5sums=('386dedd4709a043b1345e2950f103e00')
#sha1sums=('7c5c7b456ad588c5afc0610a8c4122545212fa60')
md5sums=('f1ba48517e28875011542a425d6f36e4'
         '00598e0866353f7a7b1a5ed65dc01610'
         '0537090ceeb11a2af66676481e8cf797'
         '95cd5f9fb766ab4b4f9f4f1802d7a385'
         '49b4173b1ce2942bbe292b0f27e15ab3'
         '21c8a28b85f49e01649720032085fd29')
sha1sums=('9245e80fdb0c1b2934eb145829a16b19b178590a'
          '196fde748d2e630051cc1b0bb6ed39b1e8b726f9'
          '02e2feae1da33fb0574b2979d93bc8d087224996'
          'aa1766074051a3d5760f146335cbc7690e82f265'
          'e51937b230168e4ea98b7c5a0c7118c36cf7cfd0'
          'dc8c6c86f61d6bf9d0b557b0a25a573107a8db28')
sha256sums=('8c820be71cce34ca8fe5848fc90e75ad20801d5e2af87b2751648046c1f365e1'
            '4cca2873697a3af39a96449021d7fdc2fc2b01abc9f7883946081f6be7a5ed48'
            '4eb2189c96fcfa340886b049b34dc3636d7b2bfa865140dc72edb61455d900c3'
            'fee0685e9341912144bf15c270f518fc965d975728906bd03a3fabbc8ecc685c'
            '6bd25a8a2338ce2274b849442159d2d653280676a0cb6d69492f6e4cb97cc2e0'
            '827003391265e0129456c945e8d49f556124924f820b3e6309387c5df38addd5')

changelog=${_package_name}.ChangeLog.markdown

[ "$CARCH" = "x86_64" ] && md5sums[4]='a75089028a10e5140bf18ca0b83a3041'
[ "$CARCH" = "x86_64" ] && sha256sums[4]='552df575d980929e007527f7f2563b85e9c8c9e92349646f4524e9e3a06c4027'

package() {
	local _icon_path=/usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}.v${_eclipse_timestamp}

	install -m755 -d $pkgdir/usr/{bin,share/applications}
	install -m755 -d $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,scalable}/apps

	cd $srcdir

	patch -p1 < eclipse.ini.patch
	echo $PWD
	patch -p1 < eclipse.desktop.patch
	patch -p1 < eclipse.sh.patch

	mv eclipse $pkgdir/usr/share/eclipse-jee
	install -D -m 755 eclipse.sh $pkgdir/usr/bin/eclipse-jee
	install -D -m 644 eclipse.desktop $pkgdir/usr/share/applications/eclipse-jee.desktop
	install -D -m 644 eclipse.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/eclipse-jee.svg
	ln -s ${_icon_path}/eclipse.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/eclipse-jee.png
	ln -s ${_icon_path}/eclipse32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/eclipse-jee.png
	ln -s ${_icon_path}/eclipse48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/eclipse-jee.png
}
