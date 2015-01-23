#Contributor: maz-1 <loveayawaka[at]gmail[dot]com>

pkgname=b43-tools-git
pkgver=20150122
pkgrel=1
pkgdesc="Tools for the Broadcom 43xx series WLAN chip."
arch=('i686' 'x86_64' 'ppc')
url="https://github.com/mbuesch/b43-tools"
license=('GPL2' 'GPL3')
depends=('python2')
makedepends=('git' 'bison' 'flex' 'python2')
provides=('b43-tools' 'b43-fwcutter')
conflicts=('b43-fwcutter')
source=("git+https://github.com/mbuesch/b43-tools.git")
md5sums=('SKIP')

_gitname="b43-tools"

build() {
  cd "$srcdir/$_gitname"

  sed -i -e 's/\/man\//\/share\/man\//g' fwcutter/Makefile

  make -C assembler
  make -C disassembler
  make -C fwcutter
  make -C ssb_sprom
}

package() {
  cd $srcdir/$_gitname/debug/; python2 install.py install --root "$pkgdir/"; cd ..

  make -C assembler PREFIX="$pkgdir/usr/" install
  make -C disassembler PREFIX="$pkgdir/usr/" install
  make -C fwcutter PREFIX="$pkgdir/usr/" install
  make -C ssb_sprom PREFIX="$pkgdir/usr/" install
} 
