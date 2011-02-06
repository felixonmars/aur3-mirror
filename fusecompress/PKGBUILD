# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Paulo Freire <paulofreire gmail com>

pkgname=fusecompress
pkgver=2.6
pkgrel=2
pkgdesc="A mountable Linux file system which transparently compress its content"
arch=('i686' 'x86_64')
url="http://miio.net/wordpress/projects/fusecompress/"
license=('GPL')
depends=('fuse' 'file' 'boost' 'zlib' 'bzip2' 'xz-utils' 'lzo2')
source=(http://github.com/tex/$pkgname/tarball/$pkgver
        $pkgname.patch)
md5sums=('fd63042ad54003ca7e01a89f0d58e4f3'
         'ac0f34c7ec05b84a3ebb18a9e8339f2c')

build() {
  cd "$srcdir"/tex-$pkgname-4e07d3f
  patch -Np0 -i ../$pkgname.patch || return 1
  ./configure \
    --prefix=/usr \
    --with-lzma \
    --with-z \
    --with-bz2 \
    --with-lzo2 || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
