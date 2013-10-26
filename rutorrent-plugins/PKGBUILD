# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=rutorrent-plugins
_pkgname=rutorrent
_pkgname_=plugins
pkgver=3.6
pkgrel=1
pkgdesc="All plugins for ruTorrent"
arch=('any')
url='http://code.google.com/p/rutorrent/'
license=('GPL')
groups=()
depends=('rutorrent>=3.4')
optdepends=('mediainfo'
'ffmpeg: for screenshot'
'createtorrent: to create torrent'
'transmission-cli: to create torrent'
'procps: for pgrep for plugin create'
'unzip' 'unrar'
)
replaces=('rutorrent')
options=(!strip)
source=(
http://dl.bintray.com/novik65/generic/${_pkgname_}-${pkgver}.tar.gz
plugins.ini)
package() {
  cd "$srcdir"
  install -dm755 ${pkgdir}/usr/share/webapps/${_pkgname}/plugins
  install -dm755 ${pkgdir}/etc/webapps/${_pkgname}/conf

  cp -r plugins $pkgdir/usr/share/webapps/${_pkgname}
  install -Dm644 plugins.ini ${pkgdir}/etc/webapps/${_pkgname}/conf/plugins.ini.pacnew
}
md5sums=('0d14492c75186c647ec9754e37de3771'
         'c93ff841a7a41a27a59b7f7686cf3a25')
