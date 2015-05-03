# Maintainer: You
pkgname='teamspeak3-addon-soundpack-ts3_portal_style_sounds'
pkgver='1.0'
pkgrel=1
pkgdesc='An addon for Teamspeak 3 - TS3_portal_style_sounds'
arch=('any')
url='http://addons.teamspeak.com'
license=('Unknown')
depends=('teamspeak3')
source=('addon.zip::http://addons.teamspeak.com/directory/addon/download/TS3-Portal-Style-Soundpack-by-zfg-com-de.html')
sha1sums=('883d849309c6510854cf881955a0460603f191c1')

package() {
  cd -- "$srcdir"
  mkdir -p -- "$pkgdir/opt/teamspeak3"
  rm package.ini
  rm addon.zip
  find . -type f -exec chmod a-x {} \+
  cp -R . "$pkgdir/opt/teamspeak3"
}
