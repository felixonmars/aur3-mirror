# Maintener: Martin Lee <hellnest.fuah@gmail.com>
pkgname=amazing-git
pkgver=20110128
pkgrel=1
pkgdesc="An amazing widget manager for an awesome window manager"
arch=('i686' 'x86_64')
url="http://amazing.rubyforge.org/"
license=('APACHE')
depends=('ruby')
makedepends=('git')
optdepends=("mpd: for use with Mpd widget"
            "moc: for use with Moc widget"
            "raggle: for use with Raggle widget"
            "alsa-utils: for use with Alsa widget")
provides=('amazing')
conflicts=('amazing')
source=()
md5sums=()

_gitroot="git://github.com/dag/amazing.git"
_gitname="amazing"
_gitbranch="master" # optionally set to "config"
                    # http://github.com/dag/amazing/wikis/beyond-awesome-2-2

build() {
  cd $startdir/src
  msg "Connecting to GIT server...."

  if [ ! -d $_gitname ] ; then
    git clone $_gitroot
  fi

  cd $_gitname
  git pull origin $_gitbranch

  msg2 "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build
  
  ruby setup.rb config
  ruby setup.rb install --prefix=$startdir/pkg
} 
