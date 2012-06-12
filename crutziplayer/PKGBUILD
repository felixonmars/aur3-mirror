# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=crutziplayer
pkgver=0.3.0
pkgrel=1
pkgdesc="A standalone player for NPAPI (and maybe Pepper) based browser plugins."
arch=(any)
url="http://www.crutzi.info/crutziplayer"
license=('GPL')
depends=('pygtk' 'flashplugin' 'desktop-file-utils')
install="$pkgname.install"
source=("http://www.crutzi.info/sites/default/files/${pkgname}_${pkgver}_all.deb")
md5sums=('536dadd47a7bea6536d19b32e491c69e')

package() {
  bsdtar --no-same-owner -zxvf data.tar.gz -C "$pkgdir"

  # python2 fix
  sed -i "s|bin/python|&2|" "$pkgdir/usr/bin/$pkgname"

  # permission fix
  find "$pkgdir" -type d -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et:
