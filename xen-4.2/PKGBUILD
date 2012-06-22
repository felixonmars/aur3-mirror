# Maintainer: Tritron <jacek@hebe.u>
# This pkgbuild is a modified xen4 pkgbuild. Most credits go to that maintainer.

pkgname=xen-4.2
pkgver=20120621
pkgrel=1
pkgdesc="Xen 4.2 unstable (hypervisor tools and doc) git"
arch=(i686 x86_64)
url="http://xen.org/"
license="GPL"
depends=('xz' 'bzip2' 'iproute' 'bridge-utils' 'python2' 'sdl' 'zlib' 'e2fsprogs' 'bin86' 'pkgconfig' 'gnutls' 'lzo2' 'glibc' 'yajl' 'inetutils' 'python' 'iasl' )
makedepends=('dev86' 'mercurial' 'git' 'ghostscript')
conflicts=('xen' 'xen3' 'xen4' 'xen-hv-tools' 'libxen4')
provides=('xen')
options=(!strip)
source=(xen.patch
        libxl.patch        
        09_xen)

md5sums=('67a0715a4c1ca68f708817b305a28e38'
         'bfc1d0fb814893fb9eec297deb4e2e18'  
         '1eb1de5675e4499018a37c3a5de973fe')


_gitroot="git://xenbits.xen.org/xen-unstable.git"
_gitname="xen-unstable.git"

build() {
  cd $srcdir

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd "$srcdir/$_gitname"

  
  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
    
  export COMPILER_PATH=/usr/bin
  unset CFLAGS LDFLAGS

  patch -p1 -F99 -i ../xen.patch
#  patch -p1 -F99 -i ../libxl.patch
  sed -i ./tools/firmware/etherboot/Makefile -e 's/-C \$D\/src bin\/\$/NO_WERROR=1 \-C \$D\/src bin\/\$/g'
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --enable-xenapi  --enable-vtpm
  
  make PYTHON=python2  DESTDIR=$pkgdir  install-xen
  make PYTHON=python2 DESTDIR=$pkgdir  install-tools  
  make PYTHON=python2  DESTDIR=$pkgdir  install-stubdom
  sed -i 's#XENDOM_CONFIG=/etc/sysconfig/xendomains#XENDOM_CONFIG=/etc/conf.d/xendomains#' $pkgdir/etc/init.d/xendomains
  sed -i "s#touch /var/lock/subsys/xend#mkdir -p /var/lock/subsys\n     touch /var/lock/subsys/xend#" $pkgdir/etc/init.d/xend

  [ -d $pkgdir/usr/lib64 ] && ( cd $pkgdir/usr && cp -R lib64/* lib/ && rm -R lib64 )
  ( cd $pkgdir/etc && mv init.d rc.d ) || return 1
  rm -f $pkgdir/usr/share/man/man1/qemu-img.1* \
       $pkgdir/usr/share/man/man1/qemu.1*
  # First experiment to generate grub2.cfg entry
  mkdir -p $pkgdir/etc/grub.d
  chmod +x $srcdir/09_xen
  cp $srcdir/09_xen  $pkgdir/etc/grub.d

  ############ kill unwanted stuff ############
  # stubdom: newlib
rm -rf $pkgdir/usr/*-xen-elf

# hypervisor symlinks
rm -rf $pkgdir/boot/xen-4.2.gz
rm -rf $pkgdir/boot/xen-4.gz
rm -rf $pkgdir/boot/xen.gz

# adhere to Static Library Packaging Guidelines
rm -rf $pkgdir/usr/lib/*.a 	
    
}
