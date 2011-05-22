pkgname=poison-livecd-creator
pkgver=0.1
pkgrel=2
pkgdesc="simple archlinux live cd creator"
arch=(any)
url="http://www.archlinux.org"
license=('GPL')
depends=('mkisolinux' 'squashfs-tools' 'cdrkit' 'cpio' 'tar' 'gzip')
optdepends=()
source=(poison-livecd-creator.tar.gz)
md5sums=(22d6c44d7006686ac9a250c4d4abfb95)
build()
{
  cd $srcdir
  install -v -d "$pkgdir/opt/poison-livecd-creator/conf/"
  install -v -d "$pkgdir/usr/bin"
  install -v -m644 "$srcdir/README" "$pkgdir/opt/poison-livecd-creator/" || return 1
  install -v -m644 "$srcdir/Makefile" "$pkgdir/opt/poison-livecd-creator/" || return 1
  install -v -m755 "$srcdir/poison-livecd-creator" "$pkgdir/usr/bin/" || return 1  
  cp conf $pkgdir/opt/poison-livecd-creator -r
}
