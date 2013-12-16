 # Contributor: bob_art <bobartmail@gmail.com>
pkgname=yakuake-skin-tabsonly-translucent
pkgver=1.1
pkgrel=1
pkgdesc="Yakuake skin without titlebar."
arch=('i686' 'x86_64')
url=''http://kde-look.org/content/show.php?content=162339''
license=('GPL')
depends=('yakuake')
source=('http://kde-look.org/CONTENT/content-files/162339-tabsonly-translucent.tar.gz')
md5sums=('bff8ad7270837991d92443bf6b067769')

package() {
  mkdir -p ${pkgdir}/usr/share/apps/yakuake/skins/
  cp -r ${srcdir}/tabsonly-translucent ${pkgdir}/usr/share/apps/yakuake/skins/
}
