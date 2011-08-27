#Contributor pyrho <pyrho@nomail.no>

pkgname=vim-extended-git
pkgver=20100403
pkgrel=1
pkgdesc="Vim with various extensions"
url="http://groups.google.com/group/vim_dev/web/vim-patches"
license=('GPL')
depends=('glibc' 'git')
conflicts=('vim')
#makedepends=('pkgconfig' 'git')
arch=(i686)
source=()
md5sums=()
 
_gitroot="git://repo.or.cz/vim_extended.git"
_gitname="vim_extended"
 
build() {
  msg "Connecting to GIT server...."
 
  if [[ -d $startdir/src/$_gitname ]] ; then
    cd $_gitname
    git pull origin || return 1
    msg "The local files are updated."
  else
    git clone $_gitroot || return 1
  fi
 
  msg "GIT checkout done"
  msg "Starting make..."
 
  cd $startdir/src/$_gitname
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

