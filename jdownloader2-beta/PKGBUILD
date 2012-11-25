# Maintainer: joseph28cb

pkgname=jdownloader2-beta
pkgver=LATEST
pkgrel=1
pkgdesc="A download manager for one-click hosting sites (beta version, aka JDownloader 2)"
arch=('any')
url="http://jdownloader.org/"
license=('GPL3')
depends=('bash' 'desktop-file-utils' 'hicolor-icon-theme' 'java-runtime' 'shared-mime-info')
optdepends=('kdebase-kdialog: notification support'
            'libnotify: notification support')
noextract=('icons.tar.xz')
install=jdownloader2.install
source=('jdownloader2.sh'
        'jdownloader2.xml'
        'jdownloader2.desktop'
        'icons.tar.xz')
md5sums=('bb7c327ff7c32fb0989881e5d1f51ab1'
         'f7d09ab1216c43c1e62ec85993af5d69'
         'd41b1db5bbf0856d513b4518a27ffe78'
         '1c0b9efcdc5bce164fb8c372b899cd76')

package() {
  install -dm755 "$pkgdir/usr/share/icons/hicolor"
  tar --no-same-owner -xf icons.tar.xz -C "$pkgdir/usr/share/icons/hicolor"

  install -vDm755 jdownloader2.sh "$pkgdir/usr/bin/jdownloader2"
  install -vDm644 jdownloader2.xml "$pkgdir/usr/share/mime/packages/jdownloader2.xml"
  install -vDm644 jdownloader2.desktop "$pkgdir/usr/share/applications/jdownloader2.desktop"

  ln -fs ./jdownloader2 "$pkgdir/usr/bin/jdownloader2-beta"
}

# vim:set ts=2 sw=2 et:
