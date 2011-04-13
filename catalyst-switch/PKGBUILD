# Maintainer: Radu Andries <admiral0@tuxfamily.org>
pkgname=catalyst-switch
pkgver=8.840
pkgrel=1
pkgdesc="Latest catalyst driver as of 29-03-2011 for switchable graphics ati/intel"
arch=('i686' 'x86_64')
url="http://amd.com"
license=('Proprietary')
depends=('qt' 'xorg-server' 'kernel26-headers')
makedepends=('xorg-server-devel')
provides=('libgl')
source=('https://launchpad.net/ubuntu/natty/+source/fglrx-installer/2:8.840-0ubuntu1/+files/fglrx-installer_8.840.orig.tar.gz'
	'make.sh'
	'ld.so.conf')
md5sums=('9cd68187fcc17acb9548b4daaddaa67e'
         'aa0efb0e36a1264ac8b7e23468873553'
         '0ed7f09f0f29d2efe99040db4b12c6a3')


build() {
 cd $srcdir/lib/modules/fglrx/build_mod
 cp $srcdir/make.sh .
 if [ $CARCH == "x86_64" ]; then
    cp $srcdir/arch/x86_64/lib/modules/fglrx/build_mod/libfglrx_ip.a .
 else
    cp $srcdir/arch/x86/lib/modules/fglrx/build_mod/libfglrx_ip.a .
 fi
 ./make.sh
 
}

package() {
  cd "$srcdir"
  install -d $pkgdir/lib/modules/`uname -r`/kernel/drivers/char/drm
  install -m 644 lib/modules/fglrx/build_mod/2.6.x/fglrx.ko $pkgdir/lib/modules/`uname -r`/kernel/drivers/char/drm/fglrx.ko
  if [ $CARCH == "x86_64" ]; then
    install -d $pkgdir/usr/{include,bin,sbin,share,lib32}
    install -d $pkgdir/usr/include/{ATI,GL}
    install -d $pkgdir/usr/include/ATI/GL
    install -d $pkgdir/usr/lib/fglrx
    install -d $pkgdir/usr/lib32/fglrx
    install -d $pkgdir/usr/lib/xorg/modules/{dri,drivers,extensions,linux}
    install -d $pkgdir/usr/lib/xorg/modules/extensions/fglrx
    install -d $pkgdir/usr/lib32/xorg/modules/{dri,drivers,extensions,linux}
    install -d $pkgdir/usr/lib32/xorg/modules/extensions/fglrx
    install -d $pkgdir/etc/ati
    install -m 644 arch/x86_64/usr/lib64/* $pkgdir/usr/lib
    install -m 755 arch/x86_64/usr/sbin/* $pkgdir/usr/sbin
    install -m 755 arch/x86_64/usr/X11R6/bin/* $pkgdir/usr/bin
    install -m 644 arch/x86_64/usr/X11R6/lib64/*.so* $pkgdir/usr/lib
    install -m 644 arch/x86_64/usr/X11R6/lib64/*.cap $pkgdir/usr/lib
    install -m 644 arch/x86_64/usr/X11R6/lib64/*.a $pkgdir/usr/lib
    install -m 644 arch/x86_64/usr/X11R6/lib64/fglrx/* $pkgdir/usr/lib/fglrx
    install -m 644 arch/x86_64/usr/X11R6/lib64/modules/dri/* $pkgdir/usr/lib/xorg/modules/dri
    install -m 644 etc/ati/amdpcsdb.default $pkgdir/etc/ati
    install -m 644 etc/ati/atiogl.xml $pkgdir/etc/ati
    install -m 755 etc/ati/authatieventsd.sh $pkgdir/etc/ati
    install -m 644 etc/ati/control $pkgdir/etc/ati
    install -m 644 etc/ati/logo_mask.xbm.example $pkgdir/etc/ati
    install -m 644 etc/ati/logo.xbm.example $pkgdir/etc/ati
    install -m 644 etc/ati/signature $pkgdir/etc/ati
    install -m 644 usr/include/ATI/GL/* $pkgdir/usr/include/ATI/GL
    install -m 644 usr/include/GL/* $pkgdir/usr/include/GL
    install -m 755 usr/sbin/* $pkgdir/usr/sbin
    cp -r usr/share $pkgdir/usr
    chmod -R 0644 $pkgdir/usr/share
    install -m 755 usr/X11R6/bin/* $pkgdir/usr/bin
    install -m 644 xpic_64a/usr/X11R6/lib64/modules/*.so $pkgdir/usr/lib/xorg/modules
    install -m 644 xpic_64a/usr/X11R6/lib64/modules/drivers/* $pkgdir/usr/lib/xorg/modules/drivers
    install -m 644 xpic_64a/usr/X11R6/lib64/modules/extensions/*.so $pkgdir/usr/lib/xorg/modules/extensions
    install -m 644 xpic_64a/usr/X11R6/lib64/modules/extensions/fglrx/*.so $pkgdir/usr/lib/xorg/modules/extensions/fglrx
    install -m 644 xpic_64a/usr/X11R6/lib64/modules/linux/*.so $pkgdir/usr/lib/xorg/modules/linux
    #32 BIT
    install -m 644 arch/x86/usr/lib/* $pkgdir/usr/lib32
    install -m 644 arch/x86/usr/X11R6/lib/*.so* $pkgdir/usr/lib32
    install -m 644 arch/x86/usr/X11R6/lib/*.cap $pkgdir/usr/lib32
    install -m 644 arch/x86/usr/X11R6/lib/*.a $pkgdir/usr/lib32
    install -m 644 arch/x86/usr/X11R6/lib/fglrx/* $pkgdir/usr/lib32/fglrx
    install -m 644 arch/x86/usr/X11R6/lib/modules/dri/* $pkgdir/usr/lib32/xorg/modules/dri
    install -m 644 xpic/usr/X11R6/lib/modules/*.so $pkgdir/usr/lib32/xorg/modules
    install -m 644 xpic/usr/X11R6/lib/modules/drivers/* $pkgdir/usr/lib32/xorg/modules/drivers
    install -m 644 xpic/usr/X11R6/lib/modules/extensions/*.so $pkgdir/usr/lib32/xorg/modules/extensions
    install -m 644 xpic/usr/X11R6/lib/modules/extensions/fglrx/*.so $pkgdir/usr/lib32/xorg/modules/extensions/fglrx
    install -m 644 xpic/usr/X11R6/lib/modules/linux/*.so $pkgdir/usr/lib32/xorg/modules/linux
  else
    install -d $pkgdir/usr/{include,bin,sbin,share}
    install -d $pkgdir/usr/include/{ATI,GL}
    install -d $pkgdir/usr/include/ATI/GL
    install -d $pkgdir/usr/lib/fglrx
    install -d $pkgdir/usr/lib/xorg/modules/{dri,drivers,extensions,linux}
    install -d $pkgdir/usr/lib/xorg/modules/extensions/fglrx
    install -d $pkgdir/etc/ati
    install -m 755 arch/x86/usr/X11R6/bin/* $pkgdir/usr/bin
    install -m 644 arch/x86/usr/lib/* $pkgdir/usr/lib
    install -m 755 arch/x86/usr/sbin/* $pkgdir/usr/sbin
    install -m 644 arch/x86/usr/X11R6/lib/*.so* $pkgdir/usr/lib
    install -m 644 arch/x86/usr/X11R6/lib/*.cap $pkgdir/usr/lib
    install -m 644 arch/x86/usr/X11R6/lib/*.a $pkgdir/usr/lib
    install -m 644 arch/x86/usr/X11R6/lib/fglrx/* $pkgdir/usr/lib/fglrx
    install -m 644 arch/x86/usr/X11R6/lib/modules/dri/* $pkgdir/usr/lib/xorg/modules/dri
    install -m 644 etc/ati/amdpcsdb.default $pkgdir/etc/ati
    install -m 644 etc/ati/atiogl.xml $pkgdir/etc/ati
    install -m 755 etc/ati/authatieventsd.sh $pkgdir/etc/ati
    install -m 644 etc/ati/control $pkgdir/etc/ati
    install -m 644 etc/ati/logo_mask.xbm.example $pkgdir/etc/ati
    install -m 644 etc/ati/logo.xbm.example $pkgdir/etc/ati
    install -m 644 etc/ati/signature $pkgdir/etc/ati
    install -m 644 usr/include/ATI/GL/* $pkgdir/usr/include/ATI/GL
    install -m 644 usr/include/GL/* $pkgdir/usr/include/GL
    install -m 755 usr/sbin/* $pkgdir/usr/sbin
    cp -r usr/share $pkgdir/usr
    chmod -R 0644 $pkgdir/usr/share
    install -m 755 usr/X11R6/bin/ $pkgdir/usr/bin
    install -m 644 xpic/usr/X11R6/lib/modules/*.so $pkgdir/usr/lib/xorg/modules
    install -m 644 xpic/usr/X11R6/lib/modules/drivers/* $pkgdir/usr/lib/xorg/modules/drivers
    install -m 644 xpic/usr/X11R6/lib/modules/extensions/*.so $pkgdir/usr/lib/xorg/modules/extensions
    install -m 644 xpic/usr/X11R6/lib/modules/extensions/fglrx/*.so $pkgdir/usr/lib/xorg/modules/extensions/fglrx
    install -m 644 xpic/usr/X11R6/lib/modules/linux/*.so $pkgdir/usr/lib/xorg/modules/linux
  fi
  rm $pkgdir/usr/lib/libGL.so.1.2
  rm $pkgdir/usr/lib/xorg/modules/extensions/libglx.so
  rm $pkgdir/usr/lib32/xorg/modules/extensions/libglx.so
  rm $pkgdir/usr/lib32/libGL.so.1.2

  #fix permissions
  chmod 0755 $pkgdir/usr/share/
  chmod 0755 $pkgdir/usr/share/icons
  chmod 0755 $pkgdir/usr/share/doc
  chmod 0755 $pkgdir/usr/share/man
  chmod 0755 $pkgdir/usr/share/applications
  chmod 0755 $pkgdir/usr/share/man/man8/
}

# vim:set ts=2 sw=2 et:
