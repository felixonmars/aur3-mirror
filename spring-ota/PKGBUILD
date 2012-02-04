# Contributor: Jean-Christophe Imbert <imbert@crans.org>
pkgname=spring-ota
pkgver=8.1
pkgrel=3
pkgdesc="Non GPL OTA content. Needed for many mods"
arch=('i686' 'x86_64')
url="http://spring.clan-sy.com/phpbb/viewtopic.php?t=8212"
license=('unknown')
depends=(spring)
makedepends=(unzip)
source=("http://ipxserver.dyndns.org/games/spring/mods/xta/base-ota-content.zip")
md5sums=('9f906c5eec6c122199968c303b73e9c2')

build() {
  install -D -m 644 $startdir/src/otacontent.sdz $startdir/pkg/usr/share/spring/base/otacontent.sdz
  install -D -m 644 $startdir/src/tacontent_v2.sdz $startdir/pkg/usr/share/spring/base/tacontent_v2.sdz
  install -D -m 644 $startdir/src/tatextures_v062.sdz $startdir/pkg/usr/share/spring/base/tatextures_v062.sdz
}

