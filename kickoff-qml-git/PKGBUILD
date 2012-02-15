pkgname=kickoff-qml-git
pkgver=20120215
pkgrel=1
pkgdesc="Porting of Kickoff to QML"
arch=('i686' 'x86_64')
url="http://blog.martin-graesslin.com/blog/2011/11/weekend-project-porting-kickoff-to-qml/"
license=('GPL')
depends=('kdebase-workspace>=4.8.0')
makedepends=('cmake' 'git' 'automoc4')
screenshot=("http://wstaw.org/m/2012/02/15/kickoff-qml.png")
 
_gitroot="git://anongit.kde.org/kde-workspace"
_gitpath="plasma/desktop/applets"
_gitname="kickoff"
 
build() {
  cd ${srcdir}
 
  msg "Connecting to the GIT server...."
 
  if [[ -d ${srcdir}/kde-workspace ]] ; then
    cd kde-workspace
    git checkout origin/kickoff-qml
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd kde-workspace
    git checkout origin/kickoff-qml
  fi
 
  msg "GIT checkout done"
  msg "Starting make..."
 
  rm -rf ${srcdir}/build && mkdir ${srcdir}/build
  cd ${srcdir}/build
 
  cmake ../kde-workspace -DCMAKE_INSTALL_PREFIX=/usr
  cd plasma/desktop/applets/kickoff/
  make
}
 
package() {
  cd ${srcdir}/build/plasma/desktop/applets/kickoff/
 
  make DESTDIR=${pkgdir} install
}
