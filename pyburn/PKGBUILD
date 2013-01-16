# Maintainer: TDY <tdy@archlinux.info>

pkgname=pyburn
pkgver=0.1
pkgrel=2
pkgdesc="A simple, lightweight CD-burning frontend"
arch=('any')
url="http://www.zeroflux.org/projects/pyburn"
license=('GPL')
depends=('cdrkit' 'pygtk>=2.0')
source=(http://www.zeroflux.org/proj/$pkgname/$pkgname
        $pkgname.desktop
        $pkgname.png)
md5sums=('efafdb085f93aec45b8e8087a038ac32'
         'dd6acb991368f2fec17d00b5c9dc3bd0'
         '669c1f9204c6bf22283d608cbd04668a')

package() {
  cd "$srcdir"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  sed -i '1s/python/&2/' "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
