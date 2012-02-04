# Maintainer: Mizux <webmaster@mizux.net>
# Contributor: Mizux <webmaster@mizux.net>
pkgname=openscenegraph-docs
pkgver=3.0.1
pkgrel=1
pkgdesc="Documentation for Open Scene Graph, an high performance real-time graphics toolkit"
arch=('any')
url="http://www.openscenegraph.org"
depends=()
makedepends=('doxygen' 'graphviz' 'perl')
source=(http://www.openscenegraph.org/downloads/stable_releases/OpenSceneGraph-$pkgver/source/OpenSceneGraph-$pkgver.zip)
md5sums=('c43a25d023e635c3566b2083d8e6d956')
options=(!strip)
license=('GPL')

build() {
  cd "$srcdir/OpenSceneGraph-$pkgver"
  mkdir doxygen
  doxygen -s -g Doxyfile
  sed -i -r "s|(PROJECT_NAME *=)|\1 OpenSceneGraph|" Doxyfile;
  sed -i -r "s|(PROJECT_NUMBER *=)|\1 $pkgver|" Doxyfile;
  sed -i -r "s|(OUTPUT_DIRECTORY *=)|\1 doxygen|" Doxyfile;
  sed -i -r "s|(CREATE_SUBDIRS *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(INLINE_INHERITED_MEMB *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(TAB_SIZE *= )8|\14|" Doxyfile;
  sed -i -r "s|(BUILTIN_STL_SUPPORT *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(EXTRACT_ALL *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(EXTRACT_PRIVATE *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(EXTRACT_STATIC *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(EXTRACT_ANON_NSPACES *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(SORT_MEMBERS_CTORS_1ST *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(SHOW_DIRECTORIES *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(WARN_NO_PARAMDOC *= )NO|\1YES|" Doxyfile;
  
  #sed -i -r "s|(INPUT *=)|\1 include src applications examples|" Doxyfile;
  #sed -i -r "s|(FILE_PATTERNS *=)|\1 *include* *.h *.c *.hpp *.cpp|" Doxyfile;
  sed -i -r "s|(INPUT *=)|\1 include|" Doxyfile;
  sed -i -r "s|(FILE_PATTERNS *=)|\1 *include/osg*|" Doxyfile;
  
  sed -i -r "s|(RECURSIVE *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(EXCLUDE_PATTERNS *=)|\1 */.svn/*|" Doxyfile;
  #sed -i -r "s|(SOURCE_BROWSER *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(REFERENCED_BY_RELATION *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(REFERENCES_RELATION *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(COLS_IN_ALPHA_INDEX *= )5|\12|" Doxyfile;
  sed -i -r "s|(HTML_DYNAMIC_SECTIONS *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(GENERATE_LATEX *= )YES|\1NO|" Doxyfile;
  
  sed -i -r "s|(HAVE_DOT *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(DOT_IMAGE_FORMAT *= )png|\1svg|" Doxyfile;
  sed -i -r "s|(COLLABORATION_GRAPH *= )YES|\1NO|" Doxyfile;
  #sed -i -r "s|(UML_LOOK *= )NO|\1YES|" Doxyfile;
  sed -i -r "s|(TEMPLATE_RELATIONS *= )NO|\1YES|" Doxyfile;
  #sed -i -r "s|(CALL_GRAPH *= )NO|\1YES|" Doxyfile;
  #sed -i -r "s|(CALLER_GRAPH *= )NO|\1YES|" Doxyfile;
  
  sed -i -r "s|(DOT_GRAPH_MAX_NODES *=) 50|\1 256|" Doxyfile;
  sed -i -r "s|(DOT_TRANSPARENT *= )NO|\1YES|" Doxyfile;

  doxygen Doxyfile
}

package() {
  cd "$srcdir/OpenSceneGraph-$pkgver"
  install -D -m755 LICENSE.txt "$pkgdir/usr/share/doc/openscenegraph/LICENSE"
  cd "doxygen"
  find html -type f -exec install -Dm755 "{}" "$pkgdir/usr/share/doc/openscenegraph/{}" \;
}

# vim:set ts=2 sw=2 et:
