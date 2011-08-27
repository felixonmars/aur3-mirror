# Maintainer: kevku <kevku@msn.com>
# Contributor: Xiang Yixiang <lovelinux229-at-gmail-dot-com>
# thx jarryson <jarryson@gmail.com>,this pkgbuild is modifyed his pkgbuild.
pkgname=libpps
pkgver=0.1.940
pkgrel=2
pkgdesc="PPStream libs for linux "
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.ppstream.com/"
source=("http://download.ppstream.com/linux/release_for_ubuntu.tgz")
md5sums=('7316d762d9b6a8b60a6b03f79018f098')
package() {
  cd ${srcdir}/release_for_ubuntu
  tar xzf libs_for_ubuntu.tgz
if [[ "$CARCH" == 'i686' ]]; then
  install -d $pkgdir/usr/lib
  cp -ar libs/* $pkgdir/usr/lib/
else
  install -d $pkgdir/usr/lib32
  cp -ar libs/* $pkgdir/usr/lib32/
fi
  install -Dm644 ppscdn_config.ini $pkgdir/etc/ppscdn_config.ini
}

