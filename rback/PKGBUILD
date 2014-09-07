# Submitter: Gently <toddrpartridge@gmail.com>

pkgname=rback
pkgver=0.80
pkgrel=1
pkgdesc="A generic, local, rsync-based, backup and restore script"
arch=("any")
url="https://github.com/Gen2ly/rback"
license=("GPL")
depends=("rsync" "vim")
changelog=
source=("git://github.com/Gen2ly/rback")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$pkgname
  git describe | sed 's/^v//;s/-.*//'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644  host_linxfull_exc.txt \
    "$pkgdir"/usr/share/doc/$pkgname/host_linxfull_exc.txt
  install -Dm644 license.txt  "$pkgdir"/usr/share/licenses/$pkgname/license.txt
  install -Dm755 $pkgname     "$pkgdir"/usr/bin/$pkgname
  install -d                  "$pkgdir"/usr/share/man/man1/
  pod2man --section=1 --center="$pkgname manual" --name="$pkgname" \
    --release="$pkgver" manual.pod | \
    gzip > "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}

# vim:set ts=2 sw=2 et: