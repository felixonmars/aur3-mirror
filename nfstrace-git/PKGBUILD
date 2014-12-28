pkgname=nfstrace-git
pkgver=845.fdd4a8f
pkgrel=1
pkgdesc="NFS tracing/monitoring/capturing/analyzing tool."
arch=('any')
url="https://github.com/flyboy14/SamowarMP"
license=('GPL')
makedepends=('git' 'gcc' 'cmake' 'libpcap')
depends=('libpcap')
source=("$pkgname"::'git://github.com/epam/nfstrace.git')
md5sums=( 'SKIP' )

pkgver() {
  cd ${pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname"
  cmake -DCMAKE_BUILD_TYPE=release ./
  make
}

package() {
  cd $srcdir/$pkgname
  install -Dm755 ./nfstrace $pkgdir/usr/bin/nfstrace
  for i in ./analyzers/*.so; do
    install -Dm644 $i $pkgdir/usr/lib/nfstrace/$(basename $i).so
  done
  install -Dm644 ./docs/nfstrace.8 $pkgdir/usr/share/man/man8/nfstrace.8
  for i in ./src/api/*.h; do
    install -Dm644 $i $pkgdir/usr/include/nfstrace/$(basename $i).h
  done
}

