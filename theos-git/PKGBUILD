# Maintainer: Nicholas Allen <oops DOT ur DOT dead AT gmail DOT com>
pkgname=theos-git
pkgver=1004.2ba764b
pkgrel=3
pkgdesc="Unified cross-platform iPhone Makefile system"
arch=('any')
url="https://github.com/rpetrich/theos"
license=('GPL3')
depends=('ios-toolchain' 'iphonesdk-utils' 'perl' 'python')
install=$pkgname.install
optdepends=('ios-sdk4: iOS 4.0 SDK' 'ios-sdk5: iOS 5.0 SDK' 'ios-sdk6: iOS 6.0 SDK' 'dpkg: To create .deb packages for distribution (e.g. on Cydia)')
source=("$pkgname::git://github.com/rpetrich/theos.git" "https://github.com/kokoabim/iOSOpenDev/raw/master/lib/libsubstrate.dylib" "theos-git.sh")
md5sums=('SKIP'
         '7aed319f804ba17ad0b65677d5fa8545'
         '32b939cd347807d66a47d5ce9f2f222a')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --recursive --init
  rm -rf `find  -name '.git*'`
}

package() {
  cd "$pkgdir"
  install -d opt/
  install -Dm755 "$srcdir/$pkgname.sh" etc/profile.d/$pkgname.sh
  cp -a "$srcdir/$pkgname" opt/
  cp "$srcdir/libsubstrate.dylib" "opt/$pkgname/lib"
}
