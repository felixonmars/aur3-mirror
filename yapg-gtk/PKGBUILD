# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=yapg-gtk
pkgver=0.2beta
_pkgver=0.2
pkgrel=1
pkgdesc="Frontend for pacman package's manager"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.brainspace.it/?p=213"
install=yapg-gtk.install
depends=('python-notify' 'pyalpmm-svn' 'gksu')
source=("http://www.brainspace.it/downloads/${pkgname}-beta-src-${_pkgver}.tar.gz"
	'yapg.desktop' 'yapg-autoupdate.desktop' 'yapg.png' 'yapg.sh' 'yapg-autoupdate.sh')
md5sums=('0ea8544addf1d05e03d5fb1c1138340d'
         'c0f353547f9fdb2ba0de579eb3aa22cc'
         '4a7c02102bc49ae623bad30a0560ce7a'
         '3522fde5307ecb39c0fdcbee493ea588'
         'adb3b32af2786ae6e10f3f591c4bfafc'
         '43c22e9dd7b177025092f8c86c07a60a')

build() {
  cd ${srcdir}/${pkgname}-beta-src-${_pkgver}
  install -d ${pkgdir}/usr/share/yapg
  cp -r src/* ${pkgdir}/usr/share/yapg || return 1

  # Install desktop files and icon
  install -d ${pkgdir}/usr/share/applications
  install -Dm644 ${srcdir}/yapg{,-autoupdate}.desktop \
    ${pkgdir}/usr/share/applications || return 1
  install -d ${pkgdir}/usr/share/pixmaps
  install -Dm644 ${srcdir}/yapg.png \
    ${pkgdir}/usr/share/pixmaps || return 1

  install -Dm755 ${srcdir}/yapg.sh ${pkgdir}/usr/bin/yapg || return1
  install -Dm755 ${srcdir}/yapg-autoupdate.sh ${pkgdir}/usr/bin/yapg-autoupdate || return1

  # Symlinks to binary files - not work ATM
#  install -d ${pkgdir}/usr/bin
#  ln -sf /usr/share/yapg/yapg.py ${pkgdir}/usr/bin/yapg || return 1
#  ln -sf /usr/share/yapg/yapg-autoupdate.py ${pkgdir}/usr/bin/yapg-autoupdate || return 1
}
