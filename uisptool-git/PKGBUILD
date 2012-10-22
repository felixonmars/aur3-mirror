# Contributor: CYB3R <dima@golovin.in>
# Maintainer: CYB3R <dima@golovin.in>

pkgname=uisptool-git
pkgver=20121022
pkgrel=1
pkgdesc="Userspace utility for Nercomancer's USB uISP board"
arch=('any')
url="http://ncrmnt.org/"
license=('custom')
depends=('git' 'libusb-compat')
makedepends=('git-core')
source=('10-uisp.rules')

_gitroot="git://github.com/uISP/uisp-userspace.git"
  
build() {  
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"
  
  make clean # lol
  make || exit 1
}

package(){
	install -Dm755 $srcdir/$pkgname-$pkgver/uisptool $pkgdir/usr/bin/uisptool
	install -Dm755 $srcdir/$pkgname-$pkgver/uappmgr $pkgdir/usr/bin/uappmgr
	install -Dm644 $srcdir/10-uisp.rules $pkgdir/usr/lib/udev/rules.d/10-uisp.rules
}

md5sums=('f791310a7279276c27d4c333f4f51a89')
