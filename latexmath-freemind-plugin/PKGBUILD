# Maintainer: lk <li_likun@sohu.com>


pkgname='latexmath-freemind-plugin'
pkgver='0.0.4'
pkgrel='1'
pkgdesc='LaTeXMath Freemind Plugin'
arch=('any')
url='https://github.com/Alxa/LaTeXMath-Freemind-Plugin'
license=('GPLv2')
depends=('freemind' 'jlatexmath')
makedepends=('git' 'maven')
_gitroot="git://github.com/Alxa/LaTeXMath-Freemind-Plugin.git"
_gitname="LaTeXMath-Freemind-Plugin"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  cd fm-plugin-latexmath 
  mvn package  
}

package() {
  cd "$srcdir/$_gitname-build"

  mkdir -p "$pkgdir/usr/share/freemind/plugins/latexmath"
  cp  "fm-plugin-latexmath/src/main/resources/LaTeXMath.xml" "$pkgdir/usr/share/freemind/plugins/"
  cp "/usr/share/java/jlatexmath/jlatexmath.jar" "$pkgdir/usr/share/freemind/plugins/latexmath/"
  cp "fm-plugin-latexmath/target/fm-plugin-latexmath-$pkgver-SNAPSHOT.jar" "$pkgdir/usr/share/freemind/plugins/latexmath/fm-plugin-latexmath.jar"
}

# vim:set ts=2 sw=2 et:
