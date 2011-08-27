# Contributor: Isaac Good <archlinux at isaac dot otherinbox.com>

pkgname=pdb2txt
pkgver=3
pkgrel=1
pkgdesc="Converts PDB file format to TXT and back"
arch=('any')
url="http://code.google.com/p/pdb2txt/"
license=('GPL2')
depends=(gcc-libs)
source=('http://pdb2txt.googlecode.com/files/pdb2txt.tar.gz')
md5sums=('f035e16f91232eeb8dce723827651044')

build() {
  cd "$srcdir/$pkgname"

  make || return 1
  install -D pdb2txt   "$pkgdir/usr/bin/pdb2txt"    || return 1
  install -D vlna_pipe "$pkgdir/usr/bin/vlna_pipe"  || return 1
}

# vim:set ts=2 sw=2 et:
