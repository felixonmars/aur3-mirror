# Contributor: André Ribeiro de Miranda <ardemiranda@gmail.com>

pkgname=go-gedit3-plugin
pkgver=git
pkgrel=1
pkgdesc="Go programming language plugin for gedit3 editor."
url="https://github.com/jcca/go-gedit3-plugin"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('gedit')

_gitroot='https://github.com/jcca/go-gedit3-plugin.git'
_gitname='go-gedit3-plugin'

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
  
  mkdir -p $startdir/pkg/usr/lib/gedit/plugins/
  cp -r go-gedit-plugin/ $startdir/pkg/usr/lib/gedit/plugins/
  cp -r go-gedit-plugin.plugin $startdir/pkg/usr/lib/gedit/plugins/

}

