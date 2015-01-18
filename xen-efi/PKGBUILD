# Maintainer: Doug McMillan <dlm1065@hotmail.com>
# Contributor: Tritron <jacek@hebe.u>
# Contributor: David Sutton <kantras - gmail.com>
# Contributor: Shanmu Thiagaraja <sthiagaraja+AUR@prshanmu.com>
# Contributors: Limao Luo, Luceo, Revellion, krprescott, Mevordel
# I started from scratch rewrote the PKGBUILD then looked at Sutton's build and files
# I pruned what I belived to be unneeded. I looked at Tritrons git version and altered mine
# slightly then I then then requested a critique to which  Marcel Korpel and Ivan Shapovalov
# kindly responded and  pointed out what multiple issues that were not done correctly. 
# This is the corrected version.
#                               -- dlm1065
pkgver=4.5.0
pkgrel=1
pkgbase=xen-efi
pkgname=$pkgbase
pkgdesc="Xen 4.5 (hypervisor tools and doc git ver)"
arch=(i686 x86_64)
url="http://xen.org/"
license="GPL"
depends=('xz' 'nss' 'libiscsi' 'libpng' 'bzip2' 'iproute' 'libgl'  'bridge-utils' 'python2' 'sdl' 'zlib' 'urlgrabber' 'e2fsprogs' 'bin86' 'libaio' 'pkgconfig' 'gnutls' 'lzo2' 'glibc' 'yajl' 'inetutils' 'python' 'iasl' 'spice' 'spice-protocol' 'usleep' 'bluez-libs' 'usbredir' 'transfig' 'mingw-w64-binutils' 'ovmf' 'cmake')
makedepends=('dev86' 'texi2html' 'git' 'libgl' 'ghostscript' 'markdown' 'ocaml-findlib' 'spice' 'libiscsi' 'dtc' 'libcacard' 'libaio' 'usbredir' 'spice-protocol' )
conflicts=('xen' 'xen3' 'xen4' 'xen-hv-tools' 'libxen4')
provides=('xen')
options=(!buildflags !strip)
install=xen.install
changelog=ChangeLog
source=("xen::git://xenbits.xen.org/xen.git#tag=RELEASE-4.5.0"
        "xen.install" 
        "09_xen" 
        "conf.d-xenconsoled"
        "conf.d-xenstored" 
        "efi-xen.cfg" 
        "grub.conf" 
        "4.4_Example.xen.conf")


sha256sums=('SKIP'
            'e2677827a8c2ef8b36b9c84e0953e9b291283732b81a6397f5d472b8bab8560c'
            '06c9f6140f7ef4ccfc4b1a7d9732a673313e269733180f53afcd9e43bf6c26bb'
            '48d76cc6f25caa79b3f527c96a0883b1decb9012f6616f61336c8d43791bf007'
            '0e1ad0a6a72b0c22025a556c23235a8f663427f1e769c45fe39d1c525bf82eff'
            '592f9ed540adbe94095071e4c327aefe85ee5ca057a086a9935847f36aca3be8'
            '3f0af16958c3e057b9baa5afc47050d9adf7dd553274dd97ae4f35938fefb568'
            '50a9b7fd19e8beb1dea09755f07318f36be0b7ec53d3c9e74f3266a63e682c0c')
		
custexport(){
  msg2 "export environment variables..."
   export xen_export_check="true"
   export AS86=/usr/bin/as86
   export BASH=/usr/bin/bash   
   export BCC=/usr/bin/bcc
   export BISON=/usr/bin/bison
   export CMAKE=/usr/bin/cmake
   export COMPILER_PATH=/usr/bin
   export CURL=/usr/bin/curl-config
#   export EFI_VENDOR=arch
   # EFI_VENDOR causes hypervisor to be created in /boot/efi/efi/$EFI_VENDOR 
   export EFI_DIR=/boot/efi/EFI/arch_grub 
   export PKG_EFI=\EFI\arch_grub\$
# note the backslashes are correct 
   export BOOT_DIR=/boot/
   export FIG2DEV=/usr/bin/fig2dev
   export FLEX=/usr/bin/flex
   export IASL=/usr/bin/iasl
   export LD86=/usr/bin/ld86
   export LD_EFI=/usr/x86_64-w64-mingw32/bin/ld
   export MARKDOWN=/usr/bin/markdown
   export PANDOC=/usr/bin/pandoc
   export PERL=/usr/bin/perl
   export PKG_CONFIG=/usr/bin/pkg-config
   export POD2HTML=/usr/bin/core_perl/pod2html
   export POD2MAN=/usr/bin/core_perl/pod2man
   export POD2TEXT=/usr/bin/core_perl/pod2text
   export PYTHON="/usr/bin/python2"
   export XML=/usr/bin/xml2-config
   export XGETTEXT=/usr/bin/xgettext

   # Things that should not be exported that will break the git build
   #export ZLIB_URL="http://xenbits.xen.org/xen-extfiles/zlib-1.2.3.tar.gz"
   #export LIBPCI_URL="http://xenbits.xen.org/xen-extfiles/pciutils-2.2.9.tar.bz2"
   #export NEWLIB_URL="http://xenbits.xen.org/xen-extfiles/newlib-1.16.0.tar.gz"
   #export LWIP_URL=" http://xenbits.xen.org/xen-extfiles/lwip-1.3.0.tar.gz"
   #export GRUB_URL="http://xenbits.xen.org/xen-extfiles/grub-0.97.tar.gz"
   #export OCAML_URL="http://caml.inria.fr/ocaml/pub/distrib/ocaml-4.02/ocaml-4.02.1.tar.gz"
   #export GMP_URL="http://xenbits.xen.org/xen-extfiles/gmp-4.3.2.tar.bz2"
   #export POLARSSL_URL="http://xenbits.xen.org/xen-extfiles/polarssl-1.1.4-gpl.tgz"
   #export TPMEMU_URL="http://xenbits.xen.org/xen-extfiles/tpm_emulator-0.7.4.tar.gz"
   #export COMPILER_PATH="/usr/bin"
}
prepare() { 
  msg2 "create directories upstream dies without during compile"
    mkdir -p "$srcdir"/xen/dist/install/boot/efi/efi/arch
    mkdir -p "$srcdir"/xen/src/xen/tools/firmware



 }
build() {
    custexport
    if  ld -V | grep 'pep' > /dev/null; then
      msg "binutils is setup for UEFI"
    else
      error "binutils is not setup for UEFI binutils needs to be compiled with --enable-targets=x86_64-pep" 
    fi
    cd "$srcdir"/xen
  msg2 "Starting make..."
    ./autogen.sh
    ./configure --prefix=/usr --libdir=/usr/lib/ --bindir=/usr/bin/ --sbindir=/usr/bin/ --enable-rpath --with-sysconfig-leaf-dir="default" --with-system-ovmf="/usr/share/ovmf" --with-xenstored=oxenstored --enable-systemd --with-systemd="/usr/lib/systemd/system" --with-systemd-modules-load="/etc/modules-load.d" --enable-stubdom --with-linux-backend-modules="xen-evtchn xen-gntdev xen-gntalloc xen-blkback xen-netback xen-pciback xen-acpi-processor" --localstatedir=/var
# --enable-caml-stubdom  
  #    --localstatedir=/run                              \
  #     --with-initddir="/etc/xen/scripts" \
  #     --enable-blktap2 \ 
  #     --with-linux-backend-modules="xen-evtchn xen-gntdev xen-gntalloc xen-blkback xen-netback xen-pciback xen-acpi-processor" 
# --enable-caml-stubdom  
### nered to check this -> --with-initddir="/etc/xen/scripts"
  msg2 "make world..."
    make world
}

package() {
    custexport  
 msg2 "create directories in package for arch file structure..."
    mkdir -p "$pkgdir/$EFI_DIR/"
    mkdir -p "$pkgdir"/etc/conf.d/
    mkdir -p "$pkgdir"/etc/xen/
    cd "$srcdir"
    install -Dm644 conf.d-xenstored "$pkgdir"/etc/conf.d/xenstored
    install -Dm644 conf.d-xenstored "$pkgdir"/etc/conf.d/oxenstored
    install -Dm644 conf.d-xenconsoled "$pkgdir"/etc/conf.d/xenconsoled
    install -Dm644 grub.conf "$pkgdir"/etc/xen/grub.conf
    install -Dm644 4.4_Example.xen.conf "$pkgdir"/etc/xen/4.4_Example.xen.conf
    install -Dm755 09_xen "$pkgdir"/etc/grub.d/09_xen
    install -Dm644 efi-xen.cfg "$pkgdir"/etc/xen/efi-xen.cfg
    install -Dm644 efi-xen.cfg "$pkgdir"/boot/xen.cfg
    install -Dm644 efi-xen.cfg "$pkgdir/$EFI_DIR"/boot/xen.cfg
    cd "$srcdir"/xen
  msg2 "make install..."
    make OCAMLDESTDIR="$pkgdir" DESTDIR="$pkgdir" install-xen
    make OCAMLDESTDIR="$pkgdir" DESTDIR="$pkgdir" install-tools
    make OCAMLDESTDIR="$pkgdir" DESTDIR="$pkgdir" install-docs
    make OCAMLDESTDIR="$pkgdir" DESTDIR="$pkgdir" install-stubdom

  msg2 "move files to work with arch..."  
    # Clean up udev rules naming
    mv "$pkgdir"/etc/udev/rules.d/xen-backend.rules "$pkgdir"/etc/udev/rules.d/40-xen-backend.rules
    mv "$pkgdir"/etc/default/xencommons "$pkgdir"/etc/conf.d/xencommons
    mv "$pkgdir"/etc/default/xendomains "$pkgdir"/etc/conf.d/xendomains
  msg2 "delete empty efi dir and duplicate files..."  

    # If EFI binaries build, remove duplicate directory and files generated
    ##### Kill unwanted stuff #####
    # hypervisor symlinks
    rm -f "$pkgdir"/boot/xen{,-4,-4.5}.gz
    rm -f "$pkgdir"/$EFI_DIR/xen{,-4,-4.5}.efi
}
