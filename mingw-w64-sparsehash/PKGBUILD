pkgname=mingw-w64-sparsehash
pkgver=20121213
pkgrel=1
pkgdesc="Library that contains several hash-map implementations, including implementations that optimize for space or speed. (mingw-w64 symlinks)"
arch=(any)
url="http://code.google.com/p/sparsehash"
license=("BSD")
depends=(mingw-w64-crt "sparsehash>=2.0.2")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  for _arch in ${_architectures}; do
    mkdir -p "$pkgdir/usr/${_arch}/include/google/sparsehash"
    mkdir -p "$pkgdir/usr/${_arch}/include/sparsehash/internal"
    mkdir -p "$pkgdir/usr/${_arch}/lib/pkgconfig"
    cp "/usr/lib/pkgconfig/libsparsehash.pc" "$pkgdir/usr/${_arch}/lib/pkgconfig/"
    sed -i "s,prefix=/usr,prefix=/usr/${_arch}," "$pkgdir/usr/${_arch}/lib/pkgconfig/libsparsehash.pc"
    ln -s "/usr/include/google/dense_hash_map" "$pkgdir/usr/${_arch}/include/google/dense_hash_map"
    ln -s "/usr/include/google/dense_hash_set" "$pkgdir/usr/${_arch}/include/google/dense_hash_set"
    ln -s "/usr/include/google/sparse_hash_map" "$pkgdir/usr/${_arch}/include/google/sparse_hash_map"
    ln -s "/usr/include/google/sparse_hash_set" "$pkgdir/usr/${_arch}/include/google/sparse_hash_set"
    ln -s "/usr/include/google/sparsehash/densehashtable.h" "$pkgdir/usr/${_arch}/include/google/sparsehash/densehashtable.h"
    ln -s "/usr/include/google/sparsehash/hashtable-common.h" "$pkgdir/usr/${_arch}/include/google/sparsehash/hashtable-common.h"
    ln -s "/usr/include/google/sparsehash/libc_allocator_with_realloc.h" "$pkgdir/usr/${_arch}/include/google/sparsehash/libc_allocator_with_realloc.h"
    ln -s "/usr/include/google/sparsehash/sparsehashtable.h" "$pkgdir/usr/${_arch}/include/google/sparsehash/sparsehashtable.h"
    ln -s "/usr/include/google/sparsetable" "$pkgdir/usr/${_arch}/include/google/sparsetable"
    ln -s "/usr/include/google/template_util.h" "$pkgdir/usr/${_arch}/include/google/template_util.h"
    ln -s "/usr/include/google/type_traits.h" "$pkgdir/usr/${_arch}/include/google/type_traits.h"
    ln -s "/usr/include/sparsehash/dense_hash_map" "$pkgdir/usr/${_arch}/include/sparsehash/dense_hash_map"
    ln -s "/usr/include/sparsehash/dense_hash_set" "$pkgdir/usr/${_arch}/include/sparsehash/dense_hash_set"
    ln -s "/usr/include/sparsehash/internal/densehashtable.h" "$pkgdir/usr/${_arch}/include/sparsehash/internal/densehashtable.h"
    ln -s "/usr/include/sparsehash/internal/hashtable-common.h" "$pkgdir/usr/${_arch}/include/sparsehash/internal/hashtable-common.h"
    ln -s "/usr/include/sparsehash/internal/libc_allocator_with_realloc.h" "$pkgdir/usr/${_arch}/include/sparsehash/internal/libc_allocator_with_realloc.h"
    ln -s "/usr/include/sparsehash/internal/sparseconfig.h" "$pkgdir/usr/${_arch}/include/sparsehash/internal/sparseconfig.h"
    ln -s "/usr/include/sparsehash/internal/sparsehashtable.h" "$pkgdir/usr/${_arch}/include/sparsehash/internal/sparsehashtable.h"
    ln -s "/usr/include/sparsehash/sparse_hash_map" "$pkgdir/usr/${_arch}/include/sparsehash/sparse_hash_map"
    ln -s "/usr/include/sparsehash/sparse_hash_set" "$pkgdir/usr/${_arch}/include/sparsehash/sparse_hash_set"
    ln -s "/usr/include/sparsehash/sparsetable" "$pkgdir/usr/${_arch}/include/sparsehash/sparsetable"
    ln -s "/usr/include/sparsehash/template_util.h" "$pkgdir/usr/${_arch}/include/sparsehash/template_util.h"
    ln -s "/usr/include/sparsehash/type_traits.h" "$pkgdir/usr/${_arch}/include/sparsehash/type_traits.h"
  done
}
