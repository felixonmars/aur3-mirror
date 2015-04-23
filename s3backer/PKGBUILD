# Maintainer: dbt816 <dbt@dbt816.com>
pkgname=s3backer
pkgver=1.4.0
pkgrel=1
pkgdesc="FUSE-based single file backing store via Amazon S3"
arch=(i686 x86_64)
url=https://github.com/archiecobbs/s3backer
license=(GPL)
depends=(curl fuse openssl zlib expat pkg-config)
makedepends=(git make autoconf automake)
provides=(s3backer)
conflicts=(s3backer-svn)
replaces=(s3backer)
sha256sums=()

build() {
    cd "$srcdir"
    git clone --branch 1.4.0 https://github.com/archiecobbs/s3backer.git
    cd "$pkgname"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
    mv "$pkgdir/usr/share/doc/packages/s3backer" "$pkgdir/usr/share/doc"
    rmdir "$pkgdir/usr/share/doc/packages"
}
