pkgname=lpms
pkgver=20120302
pkgrel=2
pkgdesc="Package Management System of Hadron GNU/Linux. Don't use it instead of Arch's 'pacman'. For building rootfs."
arch=('i686')
url='http://hadronproject.org/'
license=('GPL')
makedepends=('git')
depends=('fermion' 'python-magic' 'flex' 'bison' 'autoconf' 'automake' 'makedepend' 'make' 'gcc' 'sydbox')
backup=('etc/lpms/lpms.conf' 'etc/lpms/repo.conf' 'etc/lpms/build.conf' 'etc/lpms/sandbox.conf' 'etc/lpms/user')

_gitroot="git://gitorious.org/hadron/lpms.git"
_gitname="lpms"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

}

package() {
  cd "$srcdir/$_gitname-build"
  sed -i 's/python/python2/' bin/lpms
  sed -i 's/magic.MIME_TYPE/magic.MAGIC_MIME/' src/utils.py
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/lpms
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/var/tmp/lpms
  mkdir -p $pkgdir/var/cache/lpms/sources
  mkdir -p $pkgdir/etc/lpms
  mkdir -p $pkgdir/var/db/lpms
  mkdir -p $pkgdir/var/lib/lpms/
  
  cp -a src/* $pkgdir/usr/lib/python2.7/site-packages/lpms/
  cp data/* $pkgdir/etc/lpms
  cp bin/* $pkgdir/usr/bin/
}

