# Maintainer: Cristian Maureira <saint [at] archlinux.cl>

pkgname=kdestyle-divergenceiv-a-new-hope
pkgver=1
pkgrel=1
pkgdesc="A Divergence IV theme for KDE4 and QtCurve."
arch=('i686' 'x86_64')
license=('GPL')
url="http://palobo.deviantart.com/art/Divergence-4-KDE-190603742"
depends=('kdebase-workspace>=4' 'qtcurve-kde4')
source=("http://fc09.deviantart.net/fs70/f/2010/364/f/8/divergence_4_kde_by_palobo-d35hase.zip")
md5sums=('28467f0cc7c22171d3629f064e036898')

build() {
  /bin/true
}
 
package() {
  install -Dm 644 ${srcdir}/Divergence.colors ${pkgdir}/usr/share/apps/color-schemes/Divergence.colors
  install -Dm 644 ${srcdir}/Divergence.qtcurve ${pkgdir}/usr/share/apps/QtCurve/Divergence.qtcurve
}