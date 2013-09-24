# Contributor: Mariano Copetti <marianocopetti@gmail.com>

pkgname=remotelauncherserver-bin
pkgver=0.2.16
pkgrel=3
pkgdesc="Remote Launcher is an easy to use tool that enables you to launch applications remotely on your PC via your Android phone. "
arch=('i686' 'x86_64')
url="http://remotelauncher.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
makedepends=()
source=("http://sourceforge.net/projects/remotelauncher/files/${pkgver}/remotelauncherserver-${pkgver}.tar.gz")

package() {
cd $startdir/src/remotelauncherserver-${pkgver}
install -D -m755 Remote\ Launcher.jar ${pkgdir}/usr/share/remotelauncherserver/Remote\ Launcher.jar
install -D -m755 remote-launcher-server ${pkgdir}/usr/share/remotelauncherserver/remote-launcher-server
install -D -m755 remote-launcher-server.instdir ${pkgdir}/usr/share/remotelauncherserver/remote-launcher-server.instdir
install -D -m644 icons/rl_launcher.png ${pkgdir}/usr/share/pixmaps/rl_launcher.png
install -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/remotelauncherserver/icons/
install -D -m644 icons/* ${pkgdir}/usr/share/remotelauncherserver/icons/
ln -s /usr/share/remotelauncherserver/remote-launcher-server.instdir ${pkgdir}/usr/bin/remote-launcher-server
} 

sha1sums=('e8034856ae9b51455efad40f51cf15f3548b8cae')