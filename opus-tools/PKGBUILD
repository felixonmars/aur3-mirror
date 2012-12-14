# Maintainer: Michael Düll <mail@akurei.me> PGP-Key: D6777412 - Fingerprint: C972 8B50 9411 BBE1 5CA5  9906 5103 71F3 D677 7412
# Contributor: pumbur - https://aur.archlinux.org/account.php?Action=AccountInfo&ID=15935

pkgname=opus-tools
pkgver=0.1.6
pkgrel=1
pkgdesc="Opus-tools is a collection of tools for working with opus files."
arch=('i686' 'x86_64')
url="http://wiki.xiph.org/Opus-tools"
license=("BSD")
depends=('opus' 'libogg')
source=("http://downloads.xiph.org/releases/opus/opus-tools-$pkgver.tar.gz")

build(){
  cd "$srcdir/opus-tools-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/opus-tools-$pkgver"
  make DESTDIR=$pkgdir install
} 
sha512sums=('547828082c4838643eeda513f65316b60b0e44c4a0826ef39cbfa3fe81df71b30651c03ceee7729aeb74258c259014bf95ca5f01aba097a4de8334e58c8e7ce6')
