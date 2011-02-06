# Contributor: Lex Rivera <x-demon@x-demon.org>
# Contributor: B < gotleenucks at gmail dot com>
# Can easily be built against any kernel you want; just set the
# _kernver variable manually and adapt makedepends accordingly.
pkgname=(crystalhd-snapshot libcrystalhd)
pkgver=3.8.0
_svnver=164
_kernver="$(uname -r)"
pkgrel=2
makedepends=('kernel26-headers' 'svn')
arch=('i686' 'x86_64')
url="http://code.google.com/p/crystalhd-for-osx/"
license=('GPL2')
source=(2.6.35+_ioctl_replaced_by_unlocked_ioctl.patch
	add_missing_include.patch)

_svnmod=crystalhd-svn

build() {
	
    _svntrunk=http://crystalhd-for-osx.googlecode.com/svn/trunk/

    cd ${srcdir}/
    if [ -d $_svnmod/.svn ]; then
        msg "SVN tree found, reverting changes and updating to -r$pkgver"
        (cd $_svnmod && svn revert -R . && make distclean; svn up -r ${_svnver})
    else
        msg "Checking out SVN tree of -r$pkgver"
        svn co $_svntrunk --config-dir ./ -r ${_svnver} $_svnmod
    fi

    # Patch the code so it will build against 2.6.35 and higher
    cd $srcdir/$_svnmod/crystalhd/driver/linux/
    msg "Patching code so it builds with 2.6.35 and higher"
    patch -Np1 -i $srcdir/${source[0]}
    patch -Np1 -i $srcdir/${source[1]}
  
    # Revert to 8 DMA buffers; 16 DMA buffers is supposed to improve CrystalHD performance
    # but it's a bit heavy for an AppleTV with 256 MB of RAM. Damn you Apple for soldering it on!
    # If you got heaps of RAM, comment this out - you'll want 16 DMA buffers.
    # Not needed anymore if you build 3.8.0/r160 or higher.
    # sed -i '/BC_RX_LIST_CNT/s|16|8|' ${srcdir}/${_svnmod}/crystalhd/include/bc_dts_glob_lnx.h

    # Modify tresholds in an attempt to counter the framedrops and agressive RAM (and swap) usage
    #sed -i '/PAUSE_DECODER_THRESHOLD/s|12|6|' ${srcdir}/${_svnmod}/crystalhd/linux_lib/libcrystalhd/libcrystalhd_priv.h
    #sed -i '/RESUME_DECODER_THRESHOLD/s|5|3|' ${srcdir}/${_svnmod}/crystalhd/linux_lib/libcrystalhd/libcrystalhd_priv.h
 
    # Build the kernel module
    cd $srcdir/${_svnmod}/crystalhd/driver/linux
    msg "Compiling kernel module..."
    autoconf
    ./configure
    make -C /lib/modules/${_kernver}/build SUBDIRS=$(pwd) modules
    
    # Build the library
    cd $srcdir/${_svnmod}/crystalhd/linux_lib/libcrystalhd
    msg "Compiling userspace library..."
    make
    
}

package_crystalhd-snapshot() {
    
    pkgdesc="Broadcom CrystalHD kernel module, stable release from SVN tree"
    depends=('kernel26')
    conflicts=('crystalhd-svn' 'crystalhd-git')
    install=crystalhd.install
    
    cd $srcdir/${_svnmod}/crystalhd/driver/linux
    mkdir -p $pkgdir/{etc/udev/rules.d,lib/modules/${_kernver}/updates}
    
    install -m 0644 20-crystalhd.rules $pkgdir/etc/udev/rules.d/
    install -m 0644 crystalhd.ko $pkgdir/lib/modules/${_kernver}/updates/
    
}

package_libcrystalhd() {
    
    pkgdesc="Broadcom CrystalHD library, stable release from SVN tree"
    depends=('gcc-libs' 'crystalhd')
    conflicts=('libcrystalhd-svn' 'libcrystalhd-git')
    
    cd $srcdir/${_svnmod}/crystalhd/linux_lib/libcrystalhd    
    make install DESTDIR=$pkgdir

}

sha1sums=('c43277eef2fa45a4dfa8dc188e7d5f990f4e6b22'
          '7e5967c765cde9cdb04754c7a617a63af3aee0f6')

# Let's not confuse poor AUR, shall we?
pkgname=crystalhd-snapshot
pkgdesc="Broadcom CrystalHD kernel module & library, tagged releases from Google Code SVN tree"
