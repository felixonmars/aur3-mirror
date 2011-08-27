# Contributor: gtklocker <karanti.linux@googlemail.com>
# Contributor: Benjamin Mtz (cruznick) <cruznick at archlinux dot us>

pkgname=b43-fwcutter-git
pkgver=19510101
pkgrel=1
pkgdesc="Firmware extractor for the bcm43xx kernel module - git revision"
arch=(i686 x86_64)
url="http://linuxwireless.org/en/users/Drivers/b43"
provides=(b43-fwcutter)
depends=('kernel26')
makedepends=('git')
conflicts=('broadcom-wl' 'broadcom-wl-patched' 'b43-fwcutter')
license=('GPL')


# git part starting
_gitroot="git://git.bu3sch.de/b43-tools.git"
_gitmain="b43-tools"
_gitdir="fwcutter"

build() {
    cd $srcdir

  msg2 "Connecting to github.com Git server...."
  if [ -d $_gitmain ] ; then
    ( cd $_gitmain && git pull ) 
  else
    git clone $_gitroot 
  fi
     
    msg "GIT checkout done"
    msg "Starting make..."
    
    rm -rf $srcdir/$_gitmain/$_gitdir-build
    cp -r $srcdir/$_gitmain/$_gitdir $srcdir/$_gitmain/$_gitdir-build
    
    cd $srcdir/$_gitmain/$_gitdir-build

    make || return 1
    install -D -m755 b43-fwcutter $startdir/pkg/usr/bin/b43-fwcutter || return 1
    install -D -m644 b43-fwcutter.1 $startdir/pkg/usr/share/man/man1/b43-fwcutter.1 || return 1


}
