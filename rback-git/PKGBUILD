# Maintainer: Gently <toddrpartridge@gmail.com>

pkgname=rback-git
_pkgname=${pkgname%-*}
pkgver=0.80.4
pkgrel=1
pkgdesc="A generic, local, rsync-based, backup and restore script"
arch=("any")
url="https://github.com/Gen2ly/$_pkgname"
license=("GPL2")
depends=("rsync" "vim")
makedepends=("git")
source=("git://github.com/Gen2ly/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}

package() {
  cd $srcdir/$_pkgname
  install -Dm644  host_linxfull_exc.txt \
    $pkgdir/usr/share/doc/$_pkgname/host_linxfull_exc.txt
  install -Dm755 $_pkgname   $pkgdir/usr/bin/$_pkgname
  install -Dm644 license.txt $pkgdir/usr/share/licenses/$_pkgname/license.txt
  install -d                 $pkgdir/usr/share/man/man1/
  pod2man --section=1 --center="$_pkgname manual" --name=$_pkgname \
    --release="$pkgver" manual.pod | \
    gzip > $pkgdir/usr/share/man/man1/${_pkgname}.1.gz
}

# vim:set ts=2 sw=2 et:
