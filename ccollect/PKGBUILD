# Contributor: Hervé Cauwelier <herve ¤ oursours.net>
pkgname=ccollect
pkgver=0.8
pkgrel=2
pkgdesc="(pseudo) incremental backup with different exclude lists using hardlinks and rsync"
arch=('any')
url="http://www.nico.schottelius.org/software/ccollect/"
license=('GPL3')
depends=('rsync')
makedepends=('asciidoc')
source=(http://www.nico.schottelius.org/software/$pkgname/download/$pkgname-$pkgver.tar.bz2)
md5sums=('4b7e0fb9c8d1ae989582d2020996fa67')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  prefix="$pkgdir/opt/ccollect"
  tmpdir="$pkgdir/tmp"
  mkdir $tmpdir
  make prefix=$prefix path_dir=$tmpdir manlink=$tmpdir install || return 1

  # Now drop f*** symlinks
  rm $tmpdir -rf

  # Re-link binaries
  mkdir -p $pkgdir/usr/bin
  cd $pkgdir/usr/bin
  for binary in $prefix/bin/*
  do
    ln -s /opt/ccollect/bin/$(basename $binary) || return 1
  done

  # Re-link manpages
  mkdir -p $pkgdir/usr/man/man1
  cd $pkgdir/usr/man/man1
  for manpage in $prefix/man/man1/*
  do
    ln -s /opt/ccollect/man/man1/$(basename $manpage).gz || return 1
  done
}
