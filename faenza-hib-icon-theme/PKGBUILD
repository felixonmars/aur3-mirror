# Maintainer: Xtricman <xtricman@gmail.com>
pkgname=faenza-hib-icon-theme
pkgver=0.2
pkgrel=1
pkgdesc="HIB icons for both Faenza and Faience themes"
url="http://tiheum.deviantart.com/art/Faenza-and-Faience-Humble-Indie-Bundle-pack-269191024"
license=('GPL3')
arch=('any')
source=("http://fc05.deviantart.net/fs70/f/2011/328/5/7/faenza_and_faience_humble_indie_bundle_pack_by_tiheum-d4g9p4g.zip")
md5sums=('c4a57cdbfe87bad2d28897dfb12371b7')

package() {
  mkdir -p "${pkgdir}/usr/share/icons"
  cp -R --no-preserve=mode "${srcdir}/Faenza" "${pkgdir}/usr/share/icons"
  cp -R --no-preserve=mode "${srcdir}/Faience" "${pkgdir}/usr/share/icons"
  find "${pkgdir}/usr/share/icons" -name 'WorldOfGoo*' -exec rm {} \;
  find "${pkgdir}/usr/share/icons" -name 'defcon*' -exec rm {} \;
}
