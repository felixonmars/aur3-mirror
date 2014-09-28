# Maintainer: Tom Kwok <contact@tomkwok.com>
# Maintainer: Matt Warner <mattwarner2@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak-beta
_pkgname=spideroak
_PkgName=SpiderOak
pkgver=5.1.8
pkgrel=1
#_beta="yes" 
_beta="" # (no beta verison now) 
pkgdesc="Secure file backup, sync and sharing client (Beta version)"
arch=('i686' 'x86_64')
url="https://spideroak.com/"
license=('custom')
depends=()
makedepends=('desktop-file-utils')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
options=('!strip')
install=${pkgname}.install
source=(terms.txt)
sha1sums=('40d996ad01a0ca61a98264758ae8456f8f2e7f5e')

if [ "$CARCH" == x86_64 ]; then
        source+=("${_pkgname}_${pkgver}_x86_64.tgz"::"https://spideroak.com/getbuild?platform=slackware&arch=x86_64&beta=${_beta}")
        sha1sums+=('SKIP')
elif [ "$CARCH" == i686 ]; then
        source+=("${_pkgname}_${pkgver}_i386.tgz"::"https://spideroak.com/getbuild?platform=slackware&arch=i386&beta=${_beta}")
        sha1sums+=('SKIP')
fi

package() {
    # install config file
    install -Dm644 ${srcdir}/etc/dbus-1/system.d/${_PkgName}.dbus.conf ${pkgdir}/etc/dbus-1/system.d/${pkgname}.dbus.conf

    # install app in /opt
    install -dm755 ${pkgdir}/opt/
    cp -r ${srcdir}/opt/* ${pkgdir}/opt/

    # install start script file
    install -Dm755 ${srcdir}/usr/bin/${_PkgName} ${pkgdir}/usr/bin/${_PkgName}

    # install desktop and pixmap files
    install -Dm644 ${srcdir}/usr/share/applications/${_PkgName}.desktop ${pkgdir}/usr/share/applications/${_PkgName}.desktop
    install -Dm644 ${srcdir}/usr/share/pixmaps/${_PkgName}.png ${pkgdir}/usr/share/pixmaps/${_PkgName}.png

    # fix desktop file
    sed -i \
	-e "/Encoding=UTF-8/d" \
	-e "/^Name=/s: Backup::" \
	-e "/^Comment=/s:${_PkgName} ::" \
	-e "/^Categories=/s:${_PkgName};::" \
	-e "/^Icon=/s:=.*$:=${_PkgName}:" \
	-e "/^Exec=/s:=.*$:=${_PkgName}:" \
	${pkgdir}/usr/share/applications/${_PkgName}.desktop

    # install man page
    install -Dm644 ${srcdir}/usr/share/man/man1/${_PkgName}.1.gz ${pkgdir}/usr/share/man/man1/${_PkgName}.1.gz

    # install custom license file
    install -Dm644 terms.txt ${pkgdir}/usr/share/licenses/${pkgname}/terms.txt
}
