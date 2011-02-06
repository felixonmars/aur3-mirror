# Contributor: Jaroslaw Rosiek <jaroslaw.rosiek@interia.pl>
pkgname=pocketpc-cab
pkgver=1.0.1
pkgrel=1
pkgdesc="Builds an installable Pocket PC cabinet file"
url="http://packages.debian.org/unstable/otherosfs/pocketpc-cab"
license=('GPL')
depends=('lcab' 'perl')
makedepends=()
arch=('i686' 'x86_64')

source=( \
  pocketpc-cab_1.0.1.orig.tar.gz
)

build()
{
  cd $startdir/src/ || return 1
  
  cd pocketpc-cab-1.0.1.orig || return 1

  install -D -m 755 "$pkgname" "$startdir/pkg/usr/bin/$pkgname" || return 1
  install -D -m 644 "$pkgname.1" "$startdir/pkg/usr/man/man1/$pkgname.1" || return 1
  install -D -m 644 "wince_cab_format.html" "$startdir/pkg/usr/share/$pkgname/wince_cab_format.html" || return 1
}

md5sums=('30c22ded9c750238cf8ae013b5db1e94')
