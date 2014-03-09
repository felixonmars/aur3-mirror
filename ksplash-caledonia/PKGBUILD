# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Ricky <riccardo_aur at libero dot it>
# Contributor: unikum <unikum.pm at gmail dot com>

pkgname=ksplash-caledonia
_themename=Caledonia
pkgver=1.3
pkgrel=1
pkgdesc="Simple and lightweight splash screen for KDE. Official part of Caledonia Theme."
arch=('any')
url="http://sourceforge.net/projects/caledonia/files/Caledonia%20KSplash/"
license=('CCPL')
depends=('kdebase-workspace')
conflicts=('caledonia-bundle')
source=("http://downloads.sourceforge.net/project/caledonia/Caledonia%20KSplash/$_themename-KSplash-$pkgver.tar.gz")
sha512sums=('de2c8c6227d4ed62535005d142def734df8b2a16a4011eabb92df561404a56fab18a3f275096ace761370a9eee1bf411bfe5ec26f61e30c8f4274b2adceef6cc')

package() {
  cd $srcdir

  install -d $pkgdir/usr/share/apps/ksplash/Themes
  mv $srcdir/$_themename-KSplash $pkgdir/usr/share/apps/ksplash/Themes
}