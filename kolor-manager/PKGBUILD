# Contributor: justinkser

pkgname=kolor-manager
pkgver=1.0.2
pkgrel=2
pkgdesc="Oyranos CMS cross desktop settings for the KDE system settings panel"
arch=('i686' 'x86_64')
url="http://www.oyranos.org/kolormanager/"
license=('BSD')
depends=('oyranos>=0.9.5'
         'kdebase-runtime'
         'elektra')
#         'elektra=0.7.1')
conflicts=('kolor-manager-git')
makedepends=('git'
             'cmake'
             'automoc4')
provides=('kolor-manager')
x_gitroot="git://anongit.kde.org/kolor-manager.git"
x_gitname="kolor-manager"

build(){
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $x_gitname ] ; then
    cd $x_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $x_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$x_gitname-build"
  git clone "$srcdir/$x_gitname" "$srcdir/$x_gitname-build"
  cd "$srcdir/$x_gitname-build"
  git checkout -b b$pkgver v$pkgver

  sed -i 's@^\(INCLUDE\)\(( \"\.\./settings\")\)@\1_DIRECTORIES\2@' information/CMakeLists.txt

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=debugfull -DCMAKE_CXX_FLAGS="-g -Wall" .
  make -j1
}

package(){
  cd "$srcdir/$x_gitname-build"
  make DESTDIR="$pkgdir" install
}
