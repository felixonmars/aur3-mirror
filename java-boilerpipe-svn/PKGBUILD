# Maintainer: Tom Vincent <http://tlvince.com/contact/>
_pkgname=boilerpipe
pkgname=java-$_pkgname-svn
pkgver=183
pkgrel=1
pkgdesc="Boilerplate Removal and Fulltext Extraction from HTML pages"
arch=("any")
url="http://code.google.com/p/boilerpipe/"
license=("apache")
depends=("java-runtime")
makedepends=("subversion" "apache-ant")
source=("http://repo1.maven.org/maven2/xerces/xercesImpl/2.9.1/xercesImpl-2.9.1.jar"
        "http://repo1.maven.org/maven2/net/sourceforge/nekohtml/nekohtml/1.9.13/nekohtml-1.9.13.jar")
md5sums=('f807f86d7d9db25edbfc782aca7ca2a9'
         '64cedbebe524a2615ec030fa05e537e6')

_svnmod="boilerpipe-read-only"
_svntrunk="http://boilerpipe.googlecode.com/svn/trunk/"

_boilerpipe_jar="$_pkgname-1.2.0.jar"
_nekohtml_jar="nekohtml-1.9.13.jar"
_xerces_jar="xercesImpl-2.9.1.jar"

build() {
  cd "$srcdir"

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$_svnmod-build"
  cp -r "$_svnmod" "$_svnmod-build"
  cd "$_svnmod-build/boilerpipe-core"
  ant jars
}

package() {
  cd "$srcdir/$_svnmod-build/boilerpipe-core/dist"

  install -Dm644 "$_boilerpipe_jar" \
                 "$pkgdir/usr/share/java/$_pkgname/$_boilerpipe_jar"
  install -Dm644 "$startdir/$_nekohtml_jar" \
                 "$pkgdir/usr/share/java/$_pkgname/$_nekohtml_jar"
  install -Dm644 "$startdir/$_xerces_jar" \
                 "$pkgdir/usr/share/java/$_pkgname/$_xerces_jar"
}
