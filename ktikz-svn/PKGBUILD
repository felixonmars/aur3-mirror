# Contributor: Glad Deschrijver <glad.deschrijver@gmail.com>
# Contributor: Thomas Jost <thomas.jost@gmail.com>
# Contributorr: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=ktikz-svn
pkgver=202
pkgrel=1
pkgdesc="A small application helping you to create TikZ diagrams (from the LaTeX pgf package)"
arch=('i686' 'x86_64')
url="http://www.hackenberger.at/blog/ktikz-editor-for-the-tikz-language/"
license=('GPL')
depends=('poppler-qt' 'kdelibs')
makedepends=('subversion' 'texlive-core' 'automoc4' 'cmake' 'docbook-xml')
conflicts=('ktikz')
provides=('ktikz')
install=ktikz.install
md5sums=()

_svntrunk="svn://hackenberger.at/svnroot/ktikz/trunk"
_svnmod="ktikz"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
  

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install
}
