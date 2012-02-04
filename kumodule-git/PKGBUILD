# Contributor: Vojtech Kral <kral.vojtech (at) gmail.com>

pkgname=kumodule-git
pkgver=20110325
pkgrel=1
pkgdesc="EXPERIMENTAL do not use. This is a KERNEL ULTRAS kernel module - A humorous module related to a small group of Linux/Unix fans in CZ"
arch=('i686' 'x86_64')
url="http://github.com/kralyk/kumodule"
license=('GPL')

depends=('kernel26>=2.6.27')
makedepends=('git')
install=install
source=()
md5sums=()

_gitroot="git://github.com/kralyk/kumodule.git"
_gitname="kumodule"
_builddir=$_gitname-build

build()
{
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_builddir"
  git clone "$srcdir/$_gitname" "$srcdir/$_builddir"
  cd "$srcdir/$_builddir"

  make
}

package()
{
  cd "$srcdir/$_builddir"
  install -D -m 755 kumodule.ko "$pkgdir/lib/modules/`uname -r`/kernel/drivers/char/kumodule.ko"
  install -D -m 755 KU.rules "$pkgdir/etc/udev/rules.d/10-KU.rules"
}
