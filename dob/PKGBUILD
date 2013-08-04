# Maintainer: Erik Zenker <erikzenker@hotmail.com>
pkgname=dob
pkgver=20130206
pkgrel=4
pkgdesc="An easy to use backup client for local and remote backups"
arch=('i686' 'x86_64')
url="https://github.com/erikzenker/dob"
license=('GPLv3')
depends=('rsync' 'libsigc++' 'boost' 'pkg-config' 'mongodb')
makedepends=('git' 'make' 'gcc')
provides=('dob')
_gitroot=https://github.com/erikzenker/$pkgname
_gitname=$pkgname
_gitbranch=experimental


build() {
    cd $srcdir
    msg "Getting sources..."
   

   if [ -d $srcdir/$_gitname ] ; then
      (cd $_gitname && git pull --depth=1 origin master )
      	msg "The local files are updated."
   else
	git clone -b no-gui --depth=1 $_gitroot -b $_gitbranch
   fi
   

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    cd $srcdir/$_gitname

    make || return 1


}

package() {
  cd "$srcdir/$_gitname"
  install -m755 -d $pkgdir/etc/dob
  install -Dm755 dob.conf $pkgdir/etc/dob/dob.conf
  install -Dm755 dob $pkgdir/usr/bin/dob
}