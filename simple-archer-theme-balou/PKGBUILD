# Contributor: grimi <grimi at poczta dot fm>

pkgname=simple-archer-theme-balou
pkgver=1.0
pkgrel=1
pkgdesc="Theme for the xfce balou splash screen (based upon gdm simple-archer theme)"
arch=('any')
url="http://www.archlinux.org"
depends=('xfce4-session')
license=('GPL')
source=(background.png themerc)
md5sums=('ea0f5f5550f730200d8e56c8de9f6cfa'
         'ee37d6bfd3a5cefe54bcf6707f41026d')


package() {
  install -d "${pkgdir}"/usr/share/themes/simple-archer/balou
  install -m644 "${srcdir}"/{themerc,background.png} "${pkgdir}"/usr/share/themes/simple-archer/balou
}

