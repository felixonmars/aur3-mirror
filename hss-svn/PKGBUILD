# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=hss-svn
pkgver=31
pkgrel=1
pkgdesc="A tool that extends the CSS syntax with powerful features such as variables and nested blocks"
arch=(i686 x86_64)
url="http://ncannasse.fr/projects/hss"
license=('GPL')
groups=()
depends=('neko>=1.8.2')
makedepends=(subversion 'neko>=1.8.2')
options=(!strip)

_svntrunk=https://svn.motion-twin.com/hss
_svnmod=hss

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

  #
  # BUILD HERE
  #
  make
}

package() {
  install -D -T "$srcdir/$_svnmod-build"/bin/hss "$pkgdir"/usr/bin/hss
}

# vim:set ts=2 sw=2 et:
