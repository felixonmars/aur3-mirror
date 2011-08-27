# Contributor: ugaciaka <ugaciaka@gmail.com>

pkgname=twitgin-git
pkgver=20091015
pkgrel=1
pkgdesc="Change Pidgin's status message. Status message is taken from a Twitter's blog"
url="http://www.ugaciaka.wordpress.com/twitgin"
arch=('any')
license=('GPLv3')
source=('twitgin')
md5sums=('c556a8d53807f63dbe5c7867265cf670')
depends=('python' 'python-twitter' 'pidgin')
makedepends=('git')

_gitroot="git://github.com/ugaciaka/script-for-my-pc.git"
_gitname="script-for-my-pc"

build() 
{
  cd ${srcdir}

  msg "Connecting to github.com GIT server..."
  
  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Copying files to the package"

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/twitgin

  install -m755 $srcdir/$_gitname/twitgin.py $pkgdir/usr/lib/twitgin/twitgin.py
  install -m755 $srcdir/twitgin $pkgdir/usr/bin/twitgin
} 


