# Maintainer: David Zaragoza <david@zaragoza.com.ve>
pkgname=gunfudeadlands
pkgver=1.01
pkgrel=1
pkgdesc="A Far West themed 2D shooter featuring bullet time."
arch=(any)
url="http://gunfudeadlands.sourceforge.net/"
license=('GPL3')
depends=(love)
source=(http://ignum.dl.sourceforge.net/project/$pkgname/GunFu%20Deadlands%20$pkgver/GunFuDeadlands_101.love
	gunfudeadlands
	gunfudeadlands.desktop
	gunfudeadlands.png)
md5sums=('00a931e6d689c04a481d1bf526746935'
         'c085fc0d1c04aff8723352fc75a3ae3a'
         '979ef99523e78e63a2f609f516d7528d'
         '8ebc3df1619ce5f8f4018614d900fae8')

package() {
  install -D $startdir/gunfudeadlands "${pkgdir}/usr/bin/gunfudeadlands"
  install -D $startdir/GunFuDeadlands_101.love "${pkgdir}/opt/gunfudeadlands/GunFuDeadlands_101.love"
  install -D $startdir/gunfudeadlands.desktop "${pkgdir}/usr/share/applications/gunfudeadlands.desktop"
  install -D $startdir/gunfudeadlands.png "${pkgdir}/usr/share/pixmaps/gunfudeadlands.png"
}
