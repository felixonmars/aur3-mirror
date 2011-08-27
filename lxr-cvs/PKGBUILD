# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=lxr-cvs
pkgver=0.9.5
pkgrel=1
pkgdesc="A general purpose source code indexer and cross-referencer"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/lxr/"
license=(GPL)
depends=(ctags perl-file-mmagic apache)
source=(PKGBUILD lxr-cvs-$pkgver.tar.gz)
md5sums=(b2977bc0f6664f66768c87e650e4ecd9)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cp -r  *     $pkgdir/     || return 1
}

