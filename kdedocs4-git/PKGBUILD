# Contributor: Lawrence Lee <valheru@facticius.net>
pkgname=kdedocs4-git
pkgver=20110202
pkgrel=1
pkgdesc="KDE4 documentation"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('kdelibs4-git')
makedepends=('git' 'cmake' 'doxygen')
provides=(kdedocs)
conflicts=(kdedocs)

_gitroot="git://anongit.kde.org/kdelibs"
_gitname="kdelibs"

build() {
 cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  
  mkdir $srcdir/apidox
  cd $srcdir/apidox
  $startdir/src/$_gitname/doc/api/doxygen.sh $startdir/src/$_gitname/
}
package() {
  cd $srcdir/apidox
  mkdir -p $startdir/pkg/usr/share/doc/HTML/en
  mv kdelibs-apidocs $startdir/pkg/usr/share/doc/HTML/en/
  find $pkgdir/usr/share/doc/HTML/en/ -type f -exec chmod 0644 {} ';'
  rm -rf $srcdir/apidox
}