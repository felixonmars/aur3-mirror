# Contributor: Stefan Husmann <stefan-husmann.t-online.de>

pkgname=pgcedit-plugins  
pkgver=8.6
pkgrel=1 
pkgdesc="Plugins for pgcedit"
url="http://download.videohelp.com/r0lZ/pgcedit/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('pgcedit')
source=(http://download.videohelp.com/r0lZ/pgcedit/plugins/all_plugins.zip)
md5sums=('904de85a255ca2938a8144c67941a10d')
sha1sums=('33f8eae6b2bc3deb7d6f06f904f1a0a2cd93aae6')

build() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/pgcedit/plugins
  for _i in auto_comment celltimes dvdshrink lu playall puo search_replace \
    tmap vobu womble 
  do install -m644 ${_i}_plugin.tcl ${pkgdir}/usr/share/pgcedit/plugins
  done
}
