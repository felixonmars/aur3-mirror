# Maintainer: Anton Shestakov <engored*ya.ru>

pkgname=quodlibet-plugins-hg
pkgver=4559
pkgrel=1
pkgdesc="Plugins for Quod Libet, mercurial version"
arch=(any)
url="http://code.google.com/p/quodlibet/"
license=('GPL2')
depends=('quodlibet-hg')
makedepends=('mercurial' 'intltool')
provides=('quodlibet-plugins')
conflicts=('quodlibet-plugins' 'quodlibet-plugins-svn')

_hgroot=https://quodlibet.googlecode.com/hg
_hgrepo=quodlibet

build() {
  msg "Connecting to Mercurial server...."

  if [ -d "$_hgrepo" ] ; then
    cd "$_hgrepo"
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo" || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."
  
  cd "$srcdir"
  
  rm -rf "$_hgrepo-build"
  hg clone "$_hgrepo" "$_hgrepo-build"
  cd "$_hgrepo-build/plugins"
  
  _PLUGINS_BASEDIR="`python2 -c 'from quodlibet import const; print const.BASEDIR'`/plugins"    
  
  for _PLUGIN_DIR in editing events playorder songsmenu; do
    cd "$srcdir/$_hgrepo-build/plugins/$_PLUGIN_DIR"
    _PLUGIN_TARGET_DIR="$pkgdir/$_PLUGINS_BASEDIR/$_PLUGIN_DIR"
    install -m 755 -d "$_PLUGIN_TARGET_DIR" || return 1
    install -m 644 -t "$_PLUGIN_TARGET_DIR" *.py || return 1
  done
}
