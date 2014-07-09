# Maintainer: Tritron <jacek@hebe.u>
# Contributor krprescott
# Contributor Mevordel
# This pkgbuild is a modified xen4 pkgbuild. Most credits go to that maintainer.

pkgname=xen-git
pkgver=20140708
pkgrel=1
pkgdesc="Xen 4.5 unstable  (hypervisor tools and doc) git"
arch=(i686 x86_64)
url="http://xen.org/"
license="GPL"
depends=('xz' 'nss' 'libiscsi-git' 'libpng' 'bzip2' 'iproute' 'libgl'  'bridge-utils' 'python2' 'sdl' 'zlib' 'urlgrabber' 'e2fsprogs' 'bin86' 'libaio' 'pkgconfig' 'gnutls' 'lzo2' 'glibc' 'yajl' 'inetutils' 'python' 'iasl' 'spice' 'spice-protocol' 'usleep' 'libiscsi' 'bluez-libs' 'usbredir' )
makedepends=('dev86' 'texi2html' 'git' 'libgl' 'ghostscript' 'markdown' 'ocaml-findlib' 'spice' 'libiscsi' 'dtc' 'libcacard' 'libaio' 'usbredir' 'spice-protocol' )
conflicts=('xen' 'xen3' 'xen4' 'xen-hv-tools' 'libxen4')
provides=('xen')
options=(!strip !buildflags)
source=(archlinux.patch
        qxl.patch
        qemu.patch
        seabios.patch
        oxen.patch
        tmpfiles.d-$pkgname.conf
	rtc.patch
        rc.status
        proc-xen.mount
        xenconsoled.service
        xendomains.service
        xendomU.service
        xenstored.service
        var-lib-xenstored.mount        
        $pkgname.conf        
        09_xen
        hotfix.patch 
        localgcc490fix.patch
        conf.d-xenstored 
        conf.d-xenconsoled
        grub.conf
        ati.patch)

sha256sums=('85201fc40424291c925641af8c285355a757dc47f6e012f5c419e246b5e224ce'
            '479b84a7b19c8416a87a88893c90b89adec264b5848d2e716e927475ffb72c14'
            'aab36cf2d6506ff9621b0f325f4211b18d0f07f9f7c4da73731725a4fd0fd26c'
            '3749a7fd549bdd0516451b7b339491f3ee36c07693b4a994e45e41dbdd6a82d4'
            '10fb20713977bedb03cc689c27a42e6012c654fea32077d76b4294dd20459707'
            '40e0760810a49f925f2ae9f986940b40eba477dc6d3e83a78baaae096513b3cf'
            '52aad312a3b3056d3f72ed13d509a7014fc1095f71b02d5693b9aa44038511f7'
            'e045dda9492873178b991bd8c58b9c041ca4780ea28e6d80f7bee62136f539c7'
            '139eed988bfaf8edc8ccdfd0b668382bd63db48ce17be91776182a7e28e9d88c'
            'e4af7891e816b9549ebeff766a78036626c0e278734e5625b8e7d68729530ded'
            '0bd45d9de6456c4f9adf32e726f2db3a3cd0423c1d161b442e8a1666d2e68e3f'
            '1862a14607582d14247b74435dfb16411fd68904aa19e2a93c5e6ac301169d3c'
            '633d334c55395fac3f16dbe56dd7b7524d560b513d1895b53c89943033a45f39'
            'c19146931c6ab8e53092bd9b2ebbfda5c76fd22ad3b1d42dcda3dd1b61f123ff'
            '970e3f27f71b2305fc7cc0632c3c58c1356a9cc999b881f173d88ecb8feade55'
            'ff2c77244e61f296e9460d7d8eebe38735fb136971e6426d9c7e8606a351de6a'
            '020313d70708cfe3ea179ff9ab5ff0a3c4451b44bbbbb001ee0331c6b87086f9'
            'da773f02146d640d5d88a8dce205786053e9182cfb0816b895ad2727d58a2dae'
            '0e1ad0a6a72b0c22025a556c23235a8f663427f1e769c45fe39d1c525bf82eff'
            '48d76cc6f25caa79b3f527c96a0883b1decb9012f6616f61336c8d43791bf007'
            '3f0af16958c3e057b9baa5afc47050d9adf7dd553274dd97ae4f35938fefb568'
            '20daa9bf841ae9e947c0860783706e459e61a328f5233df78336bb0d15ef93ad')

_gitroot="git://xenbits.xen.org/xen.git"
_gitname="xen"
	
pkgver() {
  date +%Y%m%d
}
	
prepare() {
  cd "$srcdir"
  if [ -d $srcdir/$_gitname ] ; then
    msg "Git checkout:  Updating existing tree"
    cd $_gitname && git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone $_gitroot
  fi
  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  patch -Np1 -F99 -i "$srcdir/archlinux.patch"
  patch -Np1 -F99 -i "$srcdir/qemu.patch"
  patch -Np1 -F99 -i "$srcdir/seabios.patch"
  patch -Np1 -F99 -i "$srcdir/localgcc490fix.patch"
  patch -Np1 -F99 -i "$srcdir/oxen.patch"
  patch -Np1 -F99 -i "$srcdir/ati.patch"
  sed -i 's:/sbin:/bin:' config/StdGNU.mk
}


build()  {
   export CFLAGS+='-Wall -Wstrict-prototypes -Wno-unused-local-typedefs -Wno-sizeof-pointer-memaccess'
   cd "$srcdir/$_gitname-build"
   export COMPILER_PATH=/usr/bin
   unset CFLAGS LDFLAGS
  ./autogen.sh 
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --localstatedir=/run --disable-multilib --enable-spice --enable-usb-redir --enable-stubdom  --enable-debug  --enable-xen-pci-passthrough --enable-bluez --enable-libiscsi --enable-vhost-net --enable-linux-aio --enable-vde --enable-nptl --enable-libiscsi --enable-smartcard-nss --enable-targets=X86_64-pep
   make LANG=C PYTHON=python2 dist-{xen,tools}
   unset CFLAGS
   make LANG=C PYTHON=python2 dist-stubdom
}
package() {
    mkdir -p $pkgdir/boot/efi/efi/arch
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir" LANG=C PYTHON=python2 install-{xen,tools,stubdom}

    # Install files from AUR package
    cd ../
    for f in ${source[@]}; do
        [[ $f =~ .mount || $f =~ .service ]] && install -Dm644 $f "$pkgdir"/usr/lib/systemd/system/$f
    done
    install -Dm644 tmpfiles.d-$pkgname.conf "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
    install -Dm644 $pkgname.conf "$pkgdir"/etc/modules-load.d/$pkgname.conf
    install -Dm644 conf.d-xenstored "$pkgdir"/etc/conf.d/xenstored
    install -Dm644 conf.d-xenconsoled "$pkgdir"/etc/conf.d/xenconsoled
    install -Dm644 grub.conf "$pkgdir"/etc/xen/grub.conf
    install -Dm755 09_xen "$pkgdir"/etc/grub.d/09_xen

   
  cd $pkgdir
  ############ kill unwanted stuff ############
  # stubdom: newlib
  rm -rf $pkgdir/usr/*-xen-elf
  sed -i 's:/etc/sysconfig:/etc/conf.d:' etc/init.d/xendomains
  sed -i 's:/var/lock:/run/lock:' etc/init.d/xendomains
  sed -i 's:/var/lock:/run/lock:' etc/xen/scripts/hotplugpath.sh
  sed -i 's:/var/run:/run:' etc/init.d/xencommons
  sed -i 's:/var/run:/run:' etc/xen/scripts/hotplugpath.sh
  sed -i 's:/var/run:/run:' etc/xen/scripts/locking.sh
   mv etc/init.d/xencommons etc/xen/scripts/xencommons
   mv etc/init.d/xendomains etc/xen/scripts/xendomains
   mv etc/init.d/xen-watchdog etc/xen/scripts/xen-watchdog
   mv etc/sysconfig/xencommons etc/conf.d/xencommons
   mv etc/sysconfig/xendomains etc/conf.d/xendomains
   mv var/xen/dump var/lib/xen/
   mkdir var/log/xen/console

 # Sanitize library path (if lib64 exists)
    if [[ -d usr/lib64 ]]; then
        cd usr/
        cp -r lib64/* lib/
        rm -rf lib64
        cd ../
    fi

# hypervisor symlinks
rm -rf $pkgdir/boot/xen-4.4.gz
rm -rf $pkgdir/boot/xen-4.gz
rm -rf $pkgdir/boot/xen.gz

# adhere to Static Library Packaging Guidelines
rm -rf $pkgdir/usr/lib/*.a 	
mv etc/udev/rules.d/xen-backend.rules etc/udev/rules.d/40-xen-backend.rules    

cp -a ../../rc.status   etc 
}
