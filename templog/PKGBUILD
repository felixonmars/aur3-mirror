pkgname=templog
pkgdesc='The templog library provides a logging facility to C++ applications that employs expression templates and heavy inlining to minimize run-time overhead.'
pkgver=0.5
pkgrel=1
source=('http://downloads.sourceforge.net/project/templog/templog/templog%200.5/templog_0.5.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Ftemplog%2Ffiles%2Ftemplog%2Ftemplog%25200.5%2F&ts=1423059739&use_mirror=skylink')
arch=('any')
url=('http://sourceforge.net/projects/templog/')
license=('Boost')
sha512sums=('fbce2e9a2bbeb3f39f0db049cb051b2c1179c55e7252c7fd13bb0e496b953fefc8e0b8d7123291c4e5cad4340b6b02fd909ae5d275a6852bc109299ab3db6bbf')

package() {
  cd "$srcdir"/"$pkgname"
  
  make
  
  ar -ru "$srcdir"/"$pkgname"/imp/libtemplog.a "$srcdir"/"$pkgname"/imp/logging.o
  
  # headers
  install -m644 -D "$srcdir"/"$pkgname"/logging.h "$pkgdir"/usr/include/templog/logging.h
  install -m644 -D "$srcdir"/"$pkgname"/config.h "$pkgdir"/usr/include/templog/config.h
  install -m644 -D "$srcdir"/"$pkgname"/tuples.h "$pkgdir"/usr/include/templog/tuples.h
  install -m644 -D "$srcdir"/"$pkgname"/type_lists.h "$pkgdir"/usr/include/templog/type_lists.h
  install -m644 -D "$srcdir"/"$pkgname"/templ_meta.h "$pkgdir"/usr/include/templog/templ_meta.h
  
  # library
  install -m644 -D "$srcdir"/"$pkgname"/imp/libtemplog.a "$pkgdir"/usr/lib/libtemplog.a
  
  # license
  install -m644 -D "$srcdir"/"$pkgname"/LICENSE_1_0.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE_1_0.txt
}
