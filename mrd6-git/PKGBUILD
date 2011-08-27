pkgname=mrd6-git
arch=(i686 x86_64)
pkgver=20101024
pkgrel=2
pkgdesc="IPv6 Multicast Routing Daemon"
url="http://fivebits.net/proj/mrd6/"
license=('GPL')
optdepends=('perl: for mrd6sh')
makedepends=('git')
source=(mrd6.rc.d mrd.conf)
md5sums=('b7bae4af1b55082fd3526d4f2809282e' '8646524616ad3a2acac9311cb4b40828')
backup=('etc/mrd.conf')

_gitroot="git://github.com/hugosantos/mrd6.git"
_gitname="mrd6"

build() {
  cd $srcdir
  msg "Connecting to GIT server...."
  if [ -d $srcdir/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build
  
  make TARGET=mrd6
  make TARGET=mrd6 DESTDIR="${pkgdir}" PREFIX=/usr install
  
  install -D -m 644 docs/mrd6sh.1 "${pkgdir}/usr/share/man/man1/mrd6sh.1"
  install -D -m 644 docs/mrd6.8 "${pkgdir}/usr/share/man/man8/mrd6.8"

  install -D -m 644 "${srcdir}/mrd.conf" "${pkgdir}/etc/mrd.conf"
  install -D "${srcdir}/mrd6.rc.d" "${pkgdir}/etc/rc.d/mrd6"
}
