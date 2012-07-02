# Maintainer: Emmanuel GAUDE <gaude.emmanuel@gmail.com>

pkgname="webos-quick-install"
pkgver=4.4.0
pkgrel=2
pkgdesc="WebOS Quick Install : Alternative installer for unapproved applications on WebOS devices"

url="http://www.canuckcoding.ca"
license=('custom:canuckcoding.ca')

source=("http://dl.dropbox.com/u/2774158/WebOSQuickInstall-${pkgver}.jar"
        'LICENSE'
        'webos-quick-install')
md5sums=('f909f6dc6b29ffb6239a62824be46cf2' 
         '78fa1fbf0f1ecb05c883e10198a6ea7e'
         '6a458a524f4cc937928eb18760176e88')
arch=('i686' 'x86_64')
depends=('java-runtime>=6' 'palm-novacom-lite')
install=${pkgname}.install

package() {
  cd $startdir
  install -D -m644 WebOSQuickInstall-${pkgver}.jar "$pkgdir/usr/share/webos-quick-install/WebOSQuickInstall-${pkgver}.jar" || return 1
  mkdir "$pkgdir/usr/share/webos-quick-install/Installer" || return 1

  install -D -m755 webos-quick-install "$pkgdir/usr/bin/webos-quick-install" || return 1

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}

# vim:set ts=2 sw=2 et:
