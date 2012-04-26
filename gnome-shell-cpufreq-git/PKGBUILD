
#Maintainer: Yichao Yu <yyc1992@gmail.com>
#Contributor: Yichao Yu <yyc1992@gmail.com>

pkgname=gnome-shell-cpufreq-git
pkgver=20120426
pkgrel=1
install='gschemas.install'
pkgdesc="changing cpu frequency in gnome-shell, git version."
arch=('any')
url="https://github.com/yuyichao/gnome-shell-cpufreq"
license=('GPL')
depends=('gnome-shell' 'gnome-applets')
makedepends=('git')

_gitroot='https://yuyichao@github.com/yuyichao/gnome-shell-cpufreq.git'
_gitname='gnome-shell-cpufreq'
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

  ./install -p "$pkgdir" --nopost
}
