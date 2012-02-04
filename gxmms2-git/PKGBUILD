pkgname=gxmms2-git
pkgver=20071203
pkgrel=2
pkgdesc="A GTK2 based XMMS2 client"
arch=('i686' 'x86_64')
url="http://wejp.k.vu/projects/xmms2/"
license=('GPL')
depends=('xmms2' 'gtk2')
makedepends=('git' 'xmms2' 'gtk2')
provides=('gxmms2')
conflicts=('gxmms2')
source=('gxmms2.desktop')
md5sums=('2a09ca7203dd26e6ad61b13ea26408e0')

_gitroot="git://git.xmms.se/xmms2/gxmms2.git"
_gitname="gxmms2"

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
  
 make gxmms2 || return 1
 make PREFIX=$startdir/pkg/usr install_gxmms2 || return 1
 
 mkdir -p $startdir/pkg/usr/share/applications
 cp $startdir/gxmms2.desktop $startdir/pkg/usr/share/applications/
 }
