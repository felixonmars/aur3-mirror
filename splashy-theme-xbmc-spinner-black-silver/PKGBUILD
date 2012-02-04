# Contributor: Ralf Barth <archlinux dot org at haggy dot org>

pkgname=splashy-theme-xbmc-spinner-black-silver
pkgver=2.0
pkgrel=2
pkgdesc="Splashy theme for Xbmc"
license=('GPL3')
arch=('any')
url="http://www.xbmc.org"
depends=('splashy')
conflicts=()
source=(https://launchpad.net/~team-xbmc/+archive/ppa/+files/usplash-theme-xbmc_2.0.tar.gz
        theme.xml
        FreeSans.ttf)

build() {
  cd ${srcdir}/usplash-themes/spinner-black-silver
  install -m 644 -D xbmc_1280_720.png ${pkgdir}/usr/share/splashy/themes/xbmc-spinner-black-silver/background.png
  install -m 644 xbmc_1920_1080.png ${pkgdir}/usr/share/splashy/themes/xbmc-spinner-black-silver/background-fullhd.png
  install -m 644 {README,COPYING} ${pkgdir}/usr/share/splashy/themes/xbmc-spinner-black-silver/
  install -m 644 ${srcdir}/{theme.xml,FreeSans.ttf} ${pkgdir}/usr/share/splashy/themes/xbmc-spinner-black-silver/
  }
sha1sums=('05379d1bb80515f41b3823578eecbe0003a881ce'
          '89cdbb89476b8d37b276393b1b21573c2a1d83f9'
          '98a73152ac540693b9a186c48a0bf0f89e451e02')
