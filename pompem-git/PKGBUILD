# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so> 
pkgname="pompem-git"
pkgver="r58.83a6294"
pkgrel=1
pkgdesc="Automate the search for exploits in Exploit-db, 1337day, Packetstorm Security, etc."
arch=('i686' 'x86_64')
url="https://github.com/rfunix/Pompem"
license=('GPL')
makedepends=('python2>=2.7')
depends=('python2-requests'
        'python2-beautifulsoup3')
conflicts=('pompem')
provides=('pompem')
source=("$pkgname"::'git+https://github.com/rfunix/Pompem.git')
md5sums=('SKIP')
_bin="pompem.py"
_installdir="/usr/lib/python2.7/site-packages/$pkgname"

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  msg "Patching $pkgname"
  sed '1i#!/usr/bin/env python2' -i $_bin
  find . -name "*.pyc" -exec rm -rf {} \;
  #find . -name "*.py" -exec sed -e "s/from Bots/from $pkgname.Bots/g" -i {} \;
  #find . -name "*.py" -exec sed -e "s/from Engine/from $pkgname.Engine/g" -i {} \;
  #find . -name "*.py" -exec sed -e "s/from Model/from $pkgname.Model/g" -i {} \;
  rm optparse
}

package() {
  cd "$srcdir/$pkgname"
  msg "Packaging $pkgname into $pkgdir"
  mkdir -p $pkgdir/$_installdir
  cp -r * $pkgdir/$_installdir
  mkdir -p $pkgdir/usr/bin/
  ln -s $_installdir/$_bin $pkgdir/usr/bin/
}

# vim:set ts=8 sts=2 sw=2 et:
