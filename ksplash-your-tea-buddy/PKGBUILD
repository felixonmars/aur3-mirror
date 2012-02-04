# Contributor: Kirill Silin <kirill@silin.in>

pkgname=ksplash-your-tea-buddy
pkgver=0.1.0
pkgrel=1
pkgdesc="KDE 4 splash screen with white background and red text"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Your+tea%2C+buddy?content=140191"
license=('MIT License')
source=("http://kde-look.org/CONTENT/content-files/140191-Your%20tea,%20buddy.tar.gz")
build() {

  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/apps/ksplash/Themes
  cp -r Your\ tea,\ buddy ${pkgdir}/usr/share/apps/ksplash/Themes

}
md5sums=('78acbdce4165a3b1867f823414237d84')

