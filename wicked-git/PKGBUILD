# Contributor:  Lucas de Vries <lucasdevries@gmail.com>
arch=(i686 x86_64)
pkgname=wicked-git
pkgver=20141013
pkgrel=1
pkgdesc="Wicked widgets for the development version of the awesome window manager"
license=('GPL')
url="http://git.glacicle.com/?p=awesome/wicked.git;a=summary"

depends=('awesome')
makedepends=('git')
conflicts=('wicked' 'wicked-svn')
provides=('wicked')

_gitroot=git://git.glacicle.com/awesome/wicked.git
_gitname=wicked

package() {
  cd $startdir/src
  msg "Connecting to git server...."

  if [ -d $startdir/src/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  luac -o $startdir/src/wicked/wicked.luac $startdir/src/wicked/wicked.lua
  install -D -m644 $startdir/src/wicked/wicked.lua $startdir/pkg/usr/share/awesome/lib/wicked.lua
  install -D -m644 $startdir/src/wicked/wicked.luac $startdir/pkg/usr/share/awesome/lib/wicked.luac
  install -D -m644 $startdir/src/wicked/wicked.7.gz $startdir/pkg/usr/share/man/man7/wicked.7.gz

}
