# Author: Daniel Oertwig <Daniel.Oertwig.at.googlemail.com>
pkgname=customizepkg-patching
pkgver=0.1
pkgrel=1
pkgdesc="A tool to modify automatically PKGBUILD, modifed version using patch" 
url="http://www.proggen.org/" 
license="GPL" 
arch=('any')
depends=('bash' 'diffutils' 'patch')
optdepends=('vim: For using vimdiff')
provides=(customizepkg)
conflicts=(customizepkg)
source=($pkgname-$pkgver.src.tar.gz) 

build() { 
  	install -D -m 755 "$srcdir/$pkgname/customizepkg" "$pkgdir/usr/bin/customizepkg"
  	install -d -m 755 "$pkgdir/etc/customizepkg.d"
}
md5sums=('356f6ba543e185ccb07fbb8f6f6dde2d')
