
#Maintainer: Yichao Yu <yyc1992@gmail.com>
#Contributor: Yichao Yu <yyc1992@gmail.com>

pkgname=gnome-shell-overview-icon-git
pkgver=20111107
pkgrel=1
pkgdesc="gnome-shell extension to display icon in overview mode, git version"
arch=('any')
url="https://github.com/yuyichao/gnome-shell-overview-icon"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')

_gitroot='https://github.com/yuyichao/gnome-shell-overview-icon.git'
_gitname='gnome-shell-overview-icon'
package()
{
  cd "$srcdir"

  msg "Connecting to github.com"

  if [ -d "$startdir/src/$_gitname" ] ;then
    cd "$startdir/src/$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi
  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"

  git checkout master

  ./install -p "$pkgdir"
}
