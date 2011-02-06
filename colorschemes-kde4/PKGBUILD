# Maintainer: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=colorschemes-kde4
pkgver=20091031
pkgrel=1
pkgdesc="Top 20 highest-rated KDE color schemes for KDE 4"
arch=('any')
license=('GPL' 'CC')
url="http://kde-look.org/index.php?xcontentmode=74"
makedepends=()
source=()
md5sums=()
_url="http://kde-look.org/CONTENT/content-files"

build() {
  cd ${srcdir}

  wget --timeout 10 -c ${_url}/88852-ZvonBlack.colors \
       ${_url}/101610-Gentle.colors \
       ${_url}/101360-LuckyEyes.colors \
       ${_url}/109480-Gaia.colors \
       ${_url}/105913-Emotion.colors \
       ${_url}/103454-DarkDefault.colors \
       ${_url}/101233-GreenGreyReloaded.colors \
       ${_url}/79052-Glacier.colors \
       ${_url}/106873-ZvonBlackExtremeGreen.colors \
       ${_url}/88853-ZvonMidnight.colors \
       ${_url}/91651-OpenSUSEOrg.colors \
       ${_url}/98513-Eclipse.colors \
       ${_url}/93295-WontonSoupBrown.colors \
       ${_url}/86725-Themeinneedofaname.colors \
       ${_url}/85814-KrogBlack.colors \
       ${_url}/110226-Jbope.colors \
       ${_url}/108959-DarkRed_03.colors \
       ${_url}/103848-NeogenixBlue.colors \
       ${_url}/93144-Bukowski.colors \
       ${_url}/92148-Coral.colors

  install -d ${pkgdir}/usr/share/apps/color-schemes
  cp *.colors ${pkgdir}/usr/share/apps/color-schemes
}
