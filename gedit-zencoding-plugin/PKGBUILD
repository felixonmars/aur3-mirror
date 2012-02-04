# Contributor: Simone Economo <my.ekoes@gmail.com>

pkgname=gedit-zencoding-plugin
pkgver=20100703
pkgrel=1
pkgdesc="Set of plugins for HTML and CSS hi-speed coding"
url="http://github.com/mikecrittenden/zen-coding-gedit"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('gedit')

_gitroot='git://github.com/mikecrittenden/zen-coding-gedit.git'
_gitname='zen-coding-gedit'

build() {
  cd $startdir/src

  msg "Getting sources..."

  if [ -d $startdir/src/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
      cd $_gitname
  fi

  # Copying files
  mkdir -p $startdir/pkg/usr/lib/gedit-2/plugins/
  cp -r zencoding/ $startdir/pkg/usr/lib/gedit-2/plugins/
  cp -r zencoding.gedit-plugin $startdir/pkg/usr/lib/gedit-2/plugins/

}
