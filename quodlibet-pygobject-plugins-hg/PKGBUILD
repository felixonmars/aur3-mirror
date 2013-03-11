# Maintainer: Pedro Martinez-Julia <pedromj@um.es>
# Contributor: Anton Shestakov <engored*ya.ru>

pkgname=quodlibet-pygobject-plugins-hg
pkgver=5623
pkgrel=1
pkgdesc='Plugins for Quod Libet. PyGObject version (from Mercurial).'
arch=(any)
url='http://code.google.com/p/quodlibet/'
license=('GPL2')
depends=('quodlibet-pygobject-hg')
makedepends=('mercurial' 'intltool')
provides=('quodlibet-plugins')
conflicts=('quodlibet-plugins' 'quodlibet-plugins-svn')

_hgroot='https://quodlibet.googlecode.com/hg'
_hgrepo='quodlibet'
_hgbranch='pygobject-port'

build() {
  if [ ! -d "$_hgrepo" ] ; then
    hg clone -b "$_hgbranch" "$_hgroot" "$_hgrepo"
  fi
  cd "$_hgrepo"
  hg update "$_hgbranch"
  
  cd "$srcdir"
  
  msg 'Making a local copy of the HG repository...'
  rm -rf "$_hgrepo-build"
  hg clone "$_hgrepo" "$_hgrepo-build"
  cd "$_hgrepo-build"
  hg update "$_hgbranch"
}

package() {
  _PLUGINS_BASEDIR="`python2 -c 'from quodlibet import const; print const.BASEDIR'`/plugins"    
  for _PLUGIN_DIR in editing events playorder songsmenu; do
    cd "$srcdir/$_hgrepo-build/plugins/$_PLUGIN_DIR"
    _PLUGIN_TARGET_DIR="$pkgdir/$_PLUGINS_BASEDIR/$_PLUGIN_DIR"
    install -m 755 -d "$_PLUGIN_TARGET_DIR" || return 1
    install -m 644 -t "$_PLUGIN_TARGET_DIR" *.py || return 1
  done
}
