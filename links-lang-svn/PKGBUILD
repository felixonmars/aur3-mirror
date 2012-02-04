# Maintainer: Leif Warner <abimelech@gmail.com>
# Uncomment these lines or set as an environment variable if you wish to enable support for that database.
# They will be added to makedepends.
#LINKS_SQLITE3=true
#LINKS_MYSQL=true
#LINKS_POSTGRESQL=true
pkgname=links-lang-svn
pkgver=2187
pkgrel=1
pkgdesc="A statically-typed functional web programming language that subsumes SQL and JavaScript into the same layer."
arch=('i686' 'x86_64')
url="http://groups.inf.ed.ac.uk/links/"
license=('GPL')
depends=('rlwrap')
makedepends=('subversion' 'ocaml')
if [ -n "${LINKS_SQLITE3:+1}" ]; then
  makedepends=("${makedepends[@]}" 'ocaml-sqlite3')
fi
if [ -n "${LINKS_MYSQL:+1}" ]; then
  makedepends=("${makedepends[@]}" 'ocaml-mysql')
fi
if [ -n "${LINKS_POSTGRESQL:+1}" ]; then
  makedepends=("${makedepends[@]}" 'postgresql-ocaml')
fi
provides=('links-lang')
conflicts=('links-lang')
source=(links.config links-lang.sh)

_svntrunk=http://groups.inf.ed.ac.uk/links/svn/trunk
_svnmod=links

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  if [ -n "${LINKS_SQLITE3:+1}" ]; then
    echo 'SQLITE3_LIBDIR=/usr/lib/ocaml/sqlite3' >> Makefile.config
    echo 'database_driver=sqlite3' >> $srcdir/links.config
  fi
  if [ -n "${LINKS_MYSQL:+1}" ]; then
    echo 'MYSQL_LIBDIR=/usr/lib/ocaml/mysql' >> Makefile.config
    echo 'database_driver=mysql' >> $srcdir/links.config
  fi
  if [ -n "${LINKS_POSTGRESQL:+1}" ]; then
    echo 'POSTGRESQL_LIBDIR=/usr/lib/ocaml/postgresql' >> Makefile.config
    echo 'database_driver=postgresql' >> $srcdir/links.config
  fi
  make nc
  ./links prelude.links
}

package() {
  cd "$srcdir/$_svnmod-build"
  install -D -m755 links $pkgdir/usr/lib/$_svnmod/links
  install -m644 prelude.links $pkgdir/usr/lib/$_svnmod/prelude.links
  install -m644 prelude.links.cache $pkgdir/usr/lib/$_svnmod/prelude.links.cache

  install -D -m644 lib/js/jslib.js $pkgdir/usr/lib/links/js/jslib.js
  install -m644 lib/js/json.js $pkgdir/usr/lib/links/js/json.js
  install -m644 lib/js/regex.js $pkgdir/usr/lib/links/js/regex.js
  install -D -m644 lib/js/yahoo/yahoo.js $pkgdir/usr/lib/links/js/yahoo/yahoo.js
  install -m644 lib/js/yahoo/event.js $pkgdir/usr/lib/links/js/yahoo/event.js

  install  -m644 $srcdir/links.config $pkgdir/usr/lib/links/links.config
  install -D -m755 $srcdir/links-lang.sh $pkgdir/usr/bin/links-lang
}
md5sums=('d408bc2dc49fcba988982c0422f1fd45'
         '6947039d7618daffbd7e3b8896e7f41f')
