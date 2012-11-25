# Maintainer: FoolEcho <foolecho at gmail dot com>
pkgname=xsshfs
pkgver=0.5
pkgrel=1
pkgdesc="A GTK graphic user interface (GUI) for sshfs."
arch=('any')
url="http://forge.zici.fr/p/xsshfs/"
license=('GPL')
depends=('bash>=2.0' 'fuse' 'sshfs' 'x11-ssh-askpass' 'glade-perl' 'perl-locale-gettext' 'perl-config-tiny' 'desktop-file-utils' 'shared-mime-info' 'xdg-utils')
install=xsshfs.install
source=(http://forge.zici.fr/p/xsshfs/downloads/get/${pkgname}_${pkgver}-all_src.tar.gz)
md5sums=('e8bfbef330b88de7bab0fb173da6a2df')

package() {
  cd "$srcdir/${pkgname}_${pkgver}-all_src"
  install -dm755 ${pkgdir}/usr/{bin,share/{applications,pixmaps,${pkgname}}}/
  install -Dm755 usr/bin/xsshfs ${pkgdir}/usr/bin/
  install -Dm644 usr/share/applications/xsshfs.desktop ${pkgdir}/usr/share/applications
  install -Dm644 usr/share/pixmaps/xsshfs.svg ${pkgdir}/usr/share/pixmaps/
  install -Dm755 usr/share/xsshfs/* ${pkgdir}/usr/share/xsshfs/
}
