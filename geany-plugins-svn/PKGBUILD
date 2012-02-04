# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: eht16 <enrico.troeger@uvena.de>
# Contributor: Addict7 <nicolasfloquet@gmail.com>
pkgname=geany-plugins-svn
pkgver=2287
pkgrel=1
pkgdesc="Various plugins for Geany"
arch=('x86_64' 'i686')
url="http://plugins.geany.org/"
license=('GPL')
depends=('geany>=0.21' 'vte' 'lua' 'libwebkit' 'ctpl' 'gpgme' 'gtkspell' 'hicolor-icon-theme')
makedepends=('subversion' 'libtool' 'python' 'gpgme' 'ctpl' 'lua')
optdepends=('hspell: hebrew spell checker')
install=geany-plugins-svn.install
_svntrunk=https://geany-plugins.svn.sourceforge.net/svnroot/geany-plugins/trunk/geany-plugins
_svnmod=geany-plugins

build() {
  cd "$srcdir"

  if [ -d "$_svnmod/.svn" ]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co $_svntrunk --config-dir ./ -r "$pkgver" "$_svnmod"
  fi
  msg "SVN checkout done or server timeout"
  cd "$_svnmod"
  msg2 "Configuring..."
  ./waf configure --prefix=/usr --libexecdir=/usr/lib
  msg2 "Compiling..."
  ./waf build
}

package() {
  cd "$_svnmod"

  ./waf --destdir="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
