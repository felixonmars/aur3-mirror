# Maintainer: Jakob Nixdorf <flocke@user-helfen-usern.de>

pkgname=xfce4-perl-git
pkgver=20091101
pkgrel=1
pkgdesc="perl bindings for the Xfce 4 core libraries: libxfce4util and libxfcegui4"
depends=('perl>=5.10.0' 'glibc' 'libxfcegui4' 'libxfce4util' 'gtk2-perl' 'perl-extutils-depends' 'perl-extutils-pkgconfig')
makedepends=('git')
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://spuriousinterrupt.org/projects/xfce4-perl"
source=()
md5sums=()

_gitroot=git://git.xfce.org/bindings/xfce4-perl
_gitname=xfce4-perl

build() {
  cd ${srcdir}

  msg "Connecting to xfce.org GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}
  if [ -d ${srcdir}/cgetvid-build ] ; then
  rm -rf cgetvid-build
  fi

  cp -r cgetvid cgetvid-build

  perl Makefile.PL || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  rm $startdir/pkg/usr/lib/perl5/core_perl/perllocal.pod

}


