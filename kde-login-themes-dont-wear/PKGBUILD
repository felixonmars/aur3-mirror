# Maintainer: Gen2ly <toddrpartridge@gmail.com>

pkgname=kde-login-themes-dont-wear
pkgver=1
pkgrel=1
pkgdesc="KDE 4, Arch Linux themes - Don't Wear Style"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=116694"
license=('GPL3' 'CCPL')
depends=('kdebase-workspace')
install="$pkgname.install"
source=(http://omploader.org/vMnhvaw/kde-login-themes-dont-wear.tar.gz)
md5sums=('bcaf6a57c347d5f33d8a28625e73b37e')


build() {

  # Create destination directories
  install -d $pkgdir/usr/share/apps/kdm/themes
  install -d $pkgdir/usr/share/apps/ksplash/Themes

  # Build directory
  mkdir "$pkgname-$pkgver"
  mv kdm ksplash $pkgname-$pkgver
  cd "$srcdir/$pkgname-$pkgver"

  # Install files
  cp -r kdm/* $pkgdir/usr/share/apps/kdm/themes
  cp -r ksplash/* $pkgdir/usr/share/apps/ksplash/Themes

}
