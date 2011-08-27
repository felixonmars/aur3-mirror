# Maintainer: Robert McCathie <archaur at rmcc dot com dot au>

pkgname=insanity-git
pkgver=20100808
pkgrel=2
pkgdesc="Insanity is a simple but complete XMMS2 client. (Yes, sounds insane, doesn't it?)"
arch=('i686' 'x86_64')
url="http://xmms2.org/wiki/Client:Insanity"
license=('custom')
depends=('python>=2.3' 'pygtk>=2.8' 'xmms2>0.2DrDolittle' 'chalyx-git')
makedepends=('git')
source=('insanity.desktop')
md5sums=('a65c990498592a7237e0702f1f70ad61')

_gitroot="git://git.xmms.se/xmms2/insanity.git"
_gitname="insanity"

build() {
  cd $startdir/src
  msg "Connecting to git.xmms.se GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi
  
 make PREFIX=$startdir/pkg/usr install || return 1
 python setup.py install --prefix=$startdir/pkg/usr || return 1
 
 mkdir -p $startdir/pkg/usr/share/applications
 cp $startdir/insanity.desktop $startdir/pkg/usr/share/applications/
 }
