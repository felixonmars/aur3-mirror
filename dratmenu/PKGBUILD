# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintained by ivoarch <ivkuzev@gmail.com>
pkgname=dratmenu
pkgver=d299ddf
pkgrel=2
epoch=
pkgdesc="A trivial python hack to select windows in Ratpoison with dmenu."
arch=('i686' 'x86_64')
url="https://github.com/dimatura/dratmenu"
license=('GPL')
groups=()
depends=('dmenu' 'python2')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/dimatura/dratmenu.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  git describe --always | sed 's|-|.|g'
}

package() {
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages
  cp -r $srcdir/$pkgname $pkgdir/usr/lib/python2.7/site-packages
  mkdir -p $pkgdir/usr/bin
  echo "#!/bin/bash
          python2 /usr/lib/python2.7/site-packages/$pkgname/dratmenu.py" > $pkgdir/usr/bin/dratmenu
  chmod +x $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
