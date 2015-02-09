
pkgname=kdev-patch-git
name=kdev-patch
pkgver=20140605.972448f
pkgrel=1
pkgdesc="kdevelop with patch function"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/?p=scratch%2Fnarvaez%2Fkdev-patch.git"
license=('GPL')
depends=('kdevplatform-git' 'kdevelop-git' 'kdesdk-kompare')
conflict=('kdevplatform')
makedepends=('cmake')
options=('strip')
_gitroot="git://anongit.kde.org/scratch/narvaez/kdev-patch.git"
_gitname="$name"

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}


package() {
  msg "Connecting to GIT server..."
  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
  fi
  msg "GIT checkout done or server timeout"

  msg "Starting make..."

  rm -rf ${srcdir}/build
  cd ${srcdir}/${_gitname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
  make DESTDIR=$pkgdir install
   #ln -s "/usr/lib/libkdevplatforminterfaces.so.7" "${pkgdir}/usr/lib/libkdevplatforminterfaces.so.6"
   #ln -s "/usr/lib/libkdevplatformshell.so.7" "${pkgdir}/usr/lib/libkdevplatformshell.so.6"
   #ln -s "/usr/lib/libsublime.so.7" "${pkgdir}/usr/lib/libsublime.so.6"
}
