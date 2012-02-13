# Maintainer: wandrian <wandrian@tuxfamily.org>
# Contributor: Paolo Stivanin <admin@polslinux.it>
# You could find binary package for i686 on the "remmirath" repository
# Add this lines to your /etc/pacman.conf
# [remmirath]
# http://download.tuxfamily.org/remmirath/"

pkgname=4sync
_pkgapp=desktop4shared
pkgver=1.3
pkgrel=1
pkgdesc="4Sync (desktop4shared) is an amazing free application by
4shared.com that links all of your computers together"
arch=('i686' 'x86_64')
url="http://www.4sync.com"
license=('Freeware')
depends=('java-runtime' 'java-environment' 'groovy')
#conflicts=()
source=('http://dc399.4shared.com/download/x3JqSRo1/desktop4shared-13_1-all.deb')
md5sums=('fb2bef8791d4eb9a2fe8494448ea6e73')

build() {
 cd ${srcdir}
 bsdtar -xf ${_pkgapp}-13_1-all.deb
 bsdtar -xf data.tar.gz
 mkdir -p ${pkgdir}/usr/bin
 mkdir -p ${pkgdir}/usr/share/pixmaps
 mkdir ${pkgdir}/usr/share/applications
 mkdir ${pkgdir}/usr/share/java
 mkdir -p ${pkgdir}/usr/share/man/man1
 install -Dm755 ${srcdir}/usr/bin/${_pkgapp} ${pkgdir}/usr/bin/${_pkgapp}
 install -Dm655 ${srcdir}/usr/share/applications/${_pkgapp}.desktop ${pkgdir}/usr/share/applications/${_pkgapp}.desktop
 cp -R ${srcdir}/usr/share/java/${_pkgapp} ${pkgdir}/usr/share/java/${_pkgapp}
 install -Dm644 ${srcdir}/usr/share/man/man1/${_pkgapp}.1.gz ${pkgdir}/usr/share/man/man1/${_pkgapp}.1.gz
 install -Dm655 ${srcdir}/usr/share/pixmaps/*.* ${pkgdir}/usr/share/pixmaps/
 chown $USER: ${pkgdir}/usr/bin/${_pkgapp}
 chown -R $USER: ${pkgdir}/usr/share/java/${_pkgapp}
}
