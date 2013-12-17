 # Contributor: bob_art <bobartmail@gmail.com>
pkgname=yakuake-skin-tabs-only
pkgver=1.2
pkgrel=1
pkgdesc="Yakuake skin without titlebar."
arch=('i686' 'x86_64')
url=''http://kde-look.org/content/show.php?content=146212''
license=('GPL')
depends=('yakuake')
source=('http://kde-look.org/CONTENT/content-files/146212-tabsonly.tar.gz')
md5sums=('593863228b3ed9bd97f1c09b569721a4')

package() {
  mkdir -p ${pkgdir}/usr/share/apps/yakuake/skins/
  cp -r ${srcdir}/tabsonly ${pkgdir}/usr/share/apps/yakuake/skins/
}
