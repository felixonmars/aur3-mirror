# Maintainer: prettyvanilla <prettyvanilla@lavabit.com>

_pkgname=CLD-Icons
pkgname=cld-icons
pkgver=1.0
pkgrel=1
pkgdesc="CLD (formerly Caledonia) icon theme for KDE4"
arch=('any')
url=("https://malcer.deviantart.com/art/CLD-Icons-UNSUPPORTED-264978107")
license=('CCPL')
provides=('caledonia-icons')
conflicts=('caledonia-icons')
replaces=('caledonia-icons')
source=("http://downloads.sourceforge.net/project/cldicons/Icon%20theme/$_pkgname.tar.gz")
md5sums=('fd69f51d18c672a7b255e2772c55b0e1')

package() {
  # delete leftover .directory files
  find "$srcdir/$_pkgname/" -name '.directory' | xargs rm

  install -d "$pkgdir/usr/share/icons/"
  cp -R "$srcdir/$_pkgname/" "$pkgdir/usr/share/icons/"
}
