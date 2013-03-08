# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Andrej Nandaromovszij <sorosj@gmail.com>

pkgname=inferno-os
pkgrel=1
pkgver=550
pkgdesc="Inferno distributed operating system."
arch=('i686' 'x86_64')
url="http://code.google.com/p/inferno-os"
license=('GPL')
depends=('xorg-server')
makedepends=('make' 'gcc-multilib' 'mercurial')
source=('acmefonts.patch' 'arch1.patch' 'inferno-os.install' 'inferno-os.sh')
md5sums=('624dfd4d12747e0eec7915aeefb62059'
         '8c8dde8735c450ec27f68b5350c12405'
         'e68e9bef47ace6e0f0176a0ac189b32a'
         'e4753dfaa91ea409e81d276689ea90e1')
options=(!strip !zipman !upx)

install=${pkgname}.install

_hgroot=https://inferno-os.googlecode.com/hg/
_hgrepo=inferno-os

build() {
  cd $srcdir

  mkdir -p $pkgdir/opt/
  msg "Cloning/updating the repositories"
  msg "  Cloning acme-sac repo for fonts..."
  if [ ! -d acme-sac ]; then
    hg clone https://acme-sac.googlecode.com/hg/ acme-sac
  else
    cd acme-sac
    hg pull -u
    cd ..
  fi
  msg "  Done"
  msg "Mercurial checkouts done"

  msg "Exporting the mercurial tree somewhere...please be patient..."
  cd $srcdir/$_hgrepo
  hg archive $pkgdir/opt/$_hgrepo
# make needed directories mercurial tends to drop...
  mkdir -p $pkgdir/opt/inferno-os/Linux/386/lib/ || return 1
  mkdir -p $pkgdir/opt/inferno-os/tmp
  cd ..
  msg "Done"

  msg "Making mk..."
  cd $pkgdir/opt/$_hgrepo

  msg "  Patching the makemk file"
  patch < $srcdir/arch1.patch || return 1
  cd lib
  patch < $srcdir/acmefonts.patch || return 1
  cd ..
  export pkgdir
  ./makemk.sh || return 1
#sorry, this is ugly, but gotta do it, from now on we use mk!!!
  export TMPPATH=$PATH
  export PATH=$PATH:$pkgdir/opt/$_hgrepo/Linux/386/bin/
  msg "Mk made"

  msg "Nuking all"
  mk nuke || return 1

  msg "Building the system, please be patient..."
  mk install || return 1

  mkdir -p $pkgdir/etc/profile.d/ || return 1
  cp $srcdir/inferno-os.sh $pkgdir/etc/profile.d/ || return 1
  cp -r $srcdir/acme-sac/fonts/vera $pkgdir/opt/$_hgrepo/fonts || return 1
  cp -r $srcdir/acme-sac/fonts/10646 $pkgdir/opt/$_hgrepo/fonts || return 1

  #well, we do clean up, though...check /etc/profile.d/inferno-os.sh for info about the PATH variable
  export PATH=$TMPPATH

  msg "inferno will be installed into the /opt/inferno-os directory, the path, and emu alias are stored in /etc/profile.d/inferno-os.sh"
}

#Use acme!
