pkgname=kdebase4-git
true && pkgname=('kdebase4-dolphin-git' 'kdebase4-kdepasswd-git' 'kdebase4-kdialog-git' 'kdebase4-keditbookmarks-git'
		 'kdebase4-kfind-git' 'kdebase4-konq-plugins-git' 'kdebase4-konqueror-git' 'kdebase4-lib-git' 'kdebase4-plasma-git')
pkgver=20110716
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('kdelibs4-git' 'git' 'cmake' 'automoc4' 'tidyhtml')
conflicts=('kdebase')
groups=('kde4-git' 'kdebase4-git')

_gitroot="git://anongit.kde.org/kde-baseapps"
_gitname="kde-baseapps"

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
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi
  mkdir $srcdir/build
  cd $srcdir/build
  cmake $startdir/src/$_gitname -DCMAKE_BUILD_TYPE=debugfull \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package_kdebase4-dolphin-git() {
        pkgdesc='File Manager'
        depends=('kdebase4-runtime-git' 'kdebase4-lib-git')
        optdepends=('ruby: servicemenu installation')
	conflicts=('kdebase-dolphin')
        url="http://kde.org/applications/system/dolphin/"
        cd $srcdir/build/dolphin
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/dolphin
        make DESTDIR=$pkgdir install
}

package_kdebase4-kdepasswd-git() {
        pkgdesc='Change Password'
        depends=('kdebase4-runtime-git' 'kdebase4-lib-git')
	conflicts=('kdebase-kdepasswd')
        cd $srcdir/build/kdepasswd
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kdepasswd
        make DESTDIR=$pkgdir install
}

package_kdebase4-kdialog-git() {
        pkgdesc='A utility for displaying dialog boxes from shell scripts'
        depends=('kdebase4-runtime-git')
	conflicts=('kdebase-kdialog')
        cd $srcdir/build/kdialog
        make DESTDIR=$pkgdir install
}

package_kdebase4-keditbookmarks-git() {
        pkgdesc='Bookmark Organizer and Editor'
        depends=('kdebase4-runtime-git')
	conflicts=('kdebase-keditbookmarks')
        cd $srcdir/build/keditbookmarks
        make DESTDIR=$pkgdir install
}

package_kdebase4-kfind-git() {
        pkgdesc='Find Files/Folders'
        depends=('kdebase4-runtime-git' 'kdebase4-lib-git')
	conflicts=('kdebase-kfind')
        url="http://kde.org/applications/utilities/kfind/"
        install='kdebase4-git.install'
        cd $srcdir/build/kfind
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kfind
        make DESTDIR=$pkgdir install
}

package_kdebase4-konq-plugins-git() {
        pkgdesc='Extra plugins for Konqueror'
        depends=('kdebase4-konqueror-git' 'tidyhtml')
	conflicts=('kdebase-konq-plugins')
        install='kdebase4-git.install'
        cd $srcdir/build/konq-plugins
        make DESTDIR=$pkgdir install
}

package_kdebase4-konqueror-git() {
        pkgdesc='KDE File Manager & Web Browser'
        depends=('kdebase4-dolphin-git' 'kdebase4-keditbookmarks-git')
        optdepends=('kwebkitpart: to enable webkit engine')
	conflicts=('kdebase-konqueror')
        url="http://kde.org/applications/internet/konqueror/"
        install='kdebase4-git.install'
	for i in konqueror doc/konqueror nsplugins; do
        cd $srcdir/build/${i}
        make DESTDIR=$pkgdir install
    done
}
package_kdebase4-lib-git() {
        pkgdesc='KDE libraries for the basic desktop applications'
        depends=('kdelibs4-git')
	conflicts=('kdebase-lib')
        cd $srcdir/build/lib
        make DESTDIR=$pkgdir install
}

package_kdebase4-plasma-git() {
        pkgdesc='Display the contents of folders (User´s home folder as default)'
        depends=('kdebase4-workspace-git' 'kdebase4-lib-git')
	conflicts=('kdebase-plasma')
        cd $srcdir/build/plasma
        make DESTDIR=$pkgdir install
}

url="http://www.kde.org"
pkgdesc="KDE4 Base Programs"