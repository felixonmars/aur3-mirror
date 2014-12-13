#maintainer desarrolladores@softwareperonista.com.ar
pkgname=nomeolvides-classic-git
pkgver=0.11.0.92
pkgrel=1
pkgdesc="A simple historical facts manager - unstable version"
arch=('i686' 'x86_64')
url="http://github.com/softwareperonista/nomeolvides"
license=('GPL')
depends=('gtk3' 'xdg-utils')
makedepends=('git' 'vala' 'autogen' 'libltdl' 'intltool')
install='nomeolvides-classic-git.install'
conflicts=('nomveolvides-git')
provides=('')
source=("git://github.com/softwareperonista/nomeolvides.git")
md5sums=('SKIP')
_gitname="nomeolvides"

pkgver() {
	cd "$_gitname"
	git checkout version-inestable > /dev/null 2> /dev/null
	printf "%s\n" "$(cat configure.ac | grep AC_INIT | awk -v FS=',' '{ print $2 }' | sed 's/\ //' | awk -v FS='.' '{ print $1"."$2"."$3"." }')$(expr $(git describe --long | awk -v FS='-' '{ print $2 }') - 1)"
}

build() {

 cd "$srcdir"
 msg "Connecting to GIT server..."
 if [ -d $_gitname ] ; then
   cd $_gitname && git pull origin
   msg "The local files are updated."
 else
   git clone --depth=1 $_gitroot $_gitname
 fi
 msg "GIT checkout done or server timeout"
 
  rm -rf "$srcdir/$_gitname-build" 
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  git checkout version-inestable

  ver=$(cat configure.ac | grep AC_INIT | awk -v FS=',' '{ print $2 }' | sed 's/\ //')
  sed -i "s/${ver}/${pkgver}/" configure.ac

  ./autogen.sh --prefix=/usr --bindir=/usr/bin --disable-gnome3-support 

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}
