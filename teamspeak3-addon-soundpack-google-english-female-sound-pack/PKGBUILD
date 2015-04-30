# Maintainer: You
pkgname='teamspeak3-addon-soundpack-google-english-female-sound-pack'
pkgver='0.7'
pkgrel=1
pkgdesc='An addon for Teamspeak 3 - Google English Female Sound Pack'
arch=('any')
url='http://addons.teamspeak.com'
license=('Unknown')
depends=('teamspeak3')
source=('addon.zip::http://addons.teamspeak.com/directory/addon/download/Google-English-Female-Sound-Pack.html')
sha1sums=('004d7dbefa9f3e5665887332ecd75de183dbd9e1')

package() {
  cd -- "$srcdir"
  mkdir -p -- "$pkgdir/opt/teamspeak3"
  rm package.ini
  rm addon.zip
  find . -type f -exec chmod a-x {} \+
  cp -R . "$pkgdir/opt/teamspeak3"
}
