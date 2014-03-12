# Maintainer: Ian Naval <ianonavy@gmail.com>

pkgname=dkms-8723au-git
pkgver=0.1
pkgrel=0
pkgdesc="Driver for Realtek RTL8723AU chipset wireless cards"
arch=('i686' 'x86_64')
url="https://github.com/lwfinger/rtl8723au"
license=('GPL')
depends=('dkms' 'linux-headers')
makedepends=('git')
install=${pkgname}.install
options=(!strip)
_pkgname="8723au"

# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=("$pkgname"::'git://github.com/lwfinger/rtl8723au.git'
        "blacklist-dkms-8723au.conf")
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use contents of dkms.conf in the git source as the version number
  # (because they don't tag releases)
  grep 'VERSION' dkms.conf | sed -E 's/[^"]*"//;s/".*//'
}

build() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"

  installDir="$pkgdir/usr/src/$_pkgname-$pkgver"
 
  install -dm755 "$installDir"
  install -dm755 "$pkgdir/etc/modprobe.d"
  install -m644 "$srcdir/blacklist-dkms-8723au.conf" "$pkgdir/etc/modprobe.d/blacklist-dkms-8723au.conf"
 
  for d in `find . -type d`
  do
          install -dm755  "$installDir/$d"
  done
 
  for f in `find . -type f`
  do
          install -m644 "$srcdir/$pkgname/$f" "$installDir/$f"
  done
 
}