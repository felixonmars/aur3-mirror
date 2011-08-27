_kernver=`uname -r`

pkgname=catalyst-beta
pkgver=8.670
pkgrel=3
pkgdesc="AMD/ATI beta drivers for Radeon brand cards with support for OpenCL. Stock kernel."
arch=('i686' 'x86_64')
url="http://www.ati.amd.com"
license=('custom')
depends=('kernel26>=2.6.29' 'kernel26<2.6.32' 'netkit-bsd-finger' \
'libstdc++5' 'libxrandr' 'libsm' 'fontconfig' 'libxcursor' 'libxi' 'gcc-libs')
conflicts=('catalyst' 'catalyst-utils' 'nvidia' 'libgl' 'catalyst-leaked')
provides=('catalyst' 'catalyst-utils' 'libgl')
install=catalyst-beta.install
source=(http://download2-developer.amd.com/amd/Stream20Beta/ati-opencl-beta-driver-v2.0-beta4-lnx.zip 
	catalyst.sh amdcccle.desktop atieventsd.sh control)
md5sums=('0b0314fd2959b48e80b0b92d2a54778b'
	 'bdafe749e046bfddee2d1c5e90eabd83'
         '4efa8414a8fe9eeb50da38b5522ef81d'
         'f729bf913613f49b0b9759c246058a87'
	 '82c9bc636dd8629256aa303c21613d3d') 

build() {
/bin/sh ./fglrx-8.67/ati-driver-installer-8.67-x86.x86_64.run --extract archive_files

##Build kernel modules

if [ "${CARCH}" = "x86_64" ]; then
BUILDARCH=x86_64
_archdir=x86_64
fi
if [ "${CARCH}" = "i686" ]; then
BUILDARCH=i386
_archdir=x86
fi

cd "${srcdir}/archive_files/common/lib/modules/fglrx/build_mod"
cp "${srcdir}/archive_files/arch/${_archdir}/lib/modules/fglrx/build_mod/libfglrx_ip.a.GCC4" . || return 1
cp 2.6.x/Makefile . || return 1

make -C /lib/modules/${_kernver}/build SUBDIRS="`pwd`" ARCH=${BUILDARCH} modules || return 1

install -m755 -d "${pkgdir}/lib/modules/${_kernver}/video/"
install -m644 fglrx.ko "${pkgdir}/lib/modules/${_kernver}/video/" || return 1
install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"

# License
install -m644 "${srcdir}/archive_files/ATI_LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1

sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" $startdir/*.install

##Install catalyst utilities

# Create directories
install -m755 -d "${pkgdir}/etc/ati"
install -m755 -d "${pkgdir}/etc/rc.d"
install -m755 -d "${pkgdir}/etc/profile.d"
install -m755 -d "${pkgdir}/etc/acpi/events"

install -m755 -d "${pkgdir}/usr/lib/xorg/modules/dri"
install -m755 -d "${pkgdir}/usr/lib/xorg/modules/drivers"
install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
install -m755 -d "${pkgdir}/usr/lib/xorg/modules/linux"

install -m755 -d "${pkgdir}/usr/bin"
install -m755 -d "${pkgdir}/usr/sbin"

install -m755 -d "${pkgdir}/usr/include/X11/extensions"
install -m755 -d "${pkgdir}/usr/include/GL"

install -m755 -d "${pkgdir}/usr/share/applications"
install -m755 -d "${pkgdir}/usr/share/ati/amdcccle"
install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
install -m755 -d "${pkgdir}/usr/share/man/man8"
install -m755 -d "${pkgdir}/usr/share/pixmaps"

# X driver installation
if [ "${CARCH}" = "i686" ]; then
cd "${srcdir}/archive_files/x740/usr/X11R6/lib/modules" || return 1
elif [ "${CARCH}" = "x86_64" ]; then
cd "${srcdir}/archive_files/x740_64a/usr/X11R6/lib64/modules" || return 1
fi

install -m644 *.a "${pkgdir}/usr/lib/xorg/modules/" || return 1
install -m755 *.so "${pkgdir}/usr/lib/xorg/modules/" || return 1
install -m755 drivers/*.so "${pkgdir}/usr/lib/xorg/modules/drivers/" || return 1
install -m755 linux/*.so "${pkgdir}/usr/lib/xorg/modules/linux/" || return 1
install -m755 extensions/libglx.so "${pkgdir}/usr/lib/xorg/modules/extensions/" || return 1
install -m755 extensions/libdri.so "${pkgdir}/usr/lib/xorg/modules/extensions/libdri.ati" || return 1

# Controlcenter / library installation
if [ "${CARCH}" = "i686" ]; then
cd "${srcdir}/archive_files/arch/x86/usr" || return 1
_lib=lib
elif [ "${CARCH}" = "x86_64" ]; then
cd "${srcdir}/archive_files/arch/x86_64/usr" || return 1
_lib=lib64
fi

install -m755 X11R6/bin/* "${pkgdir}/usr/bin/" || return 1
install -m755 sbin/* "${pkgdir}/usr/sbin/" || return 1
install -m755 X11R6/${_lib}/*.so* "${pkgdir}/usr/lib/" || return 1
install -m644 X11R6/${_lib}/*.a "${pkgdir}/usr/lib/" || return 1 # really needed?
install -m644 X11R6/${_lib}/*.cap "${pkgdir}/usr/lib/" || return 1
install -m755 X11R6/${_lib}/modules/dri/*.so "${pkgdir}/usr/lib/xorg/modules/dri/" || return 1
install -m755 ${_lib}/*.so "${pkgdir}/usr/lib/" || return 1

ln -sf /usr/lib/xorg/modules/dri ${pkgdir}/usr/lib/dri
ln -sf libfglrx_dm.so.1.0 "${pkgdir}/usr/lib/libfglrx_dm.so.1"
ln -sf libfglrx_pp.so.1.0 "${pkgdir}/usr/lib/libfglrx_pp.so.1"
ln -sf libfglrx_tvout.so.1.0 "${pkgdir}/usr/lib/libfglrx_tvout.so.1"
ln -sf libfglrx_gamma.so.1.0 "${pkgdir}/usr/lib/libfglrx_gamma.so.1"
ln -sf libGL.so.1.2 "${pkgdir}/usr/lib/libGL.so.1"
ln -sf libGL.so.1.2 "${pkgdir}/usr/lib/libGL.so"

cd "${srcdir}"/archive_files/common
install -m644 etc/ati/* "${pkgdir}/etc/ati/" || return 1
chmod 755 "${pkgdir}/etc/ati/authatieventsd.sh" || return 1

install -m644 usr/X11R6/include/X11/extensions/*.h "${pkgdir}/usr/include/X11/extensions/" || return 1
install -m644 usr/X11R6/bin/amdupdaterandrconfig "${pkgdir}/usr/bin/" || return 1
install -m644 usr/include/GL/*.h "${pkgdir}/usr/include/GL/" || return 1
install -m755 usr/sbin/*.sh "${pkgdir}/usr/sbin/" || return 1
install -m644 usr/share/ati/amdcccle/* "${pkgdir}/usr/share/ati/amdcccle/" || return 1 # ? what are these files for?
# install -m644 usr/share/gnome/apps/amdcccle.desktop "${pkgdir}/usr/share/applications/" || return 1
install -m644 usr/share/icons/*.xpm "${pkgdir}/usr/share/pixmaps/" || return 1
install -m644 usr/share/man/man8/*.8 "${pkgdir}/usr/share/man/man8/" || return 1
install -m644 "${srcdir}/amdcccle.desktop" "${pkgdir}/usr/share/applications/" || return 1

# ACPI example files
install -m755 usr/share/doc/fglrx/examples/etc/acpi/*.sh "${pkgdir}/etc/acpi/" || return 1
sed -i -e 's/usr\/X11R6/usr/g' "${pkgdir}/etc/acpi/ati-powermode.sh" || return 1
install -m644 usr/share/doc/fglrx/examples/etc/acpi/events/* "${pkgdir}/etc/acpi/events/" || return 1

# replace original control file with the 8.660 version which support HD2xxx and HD3xxx
install -m755 "${srcdir}/control" "${pkgdir}/etc/ati/" || return 1

# Add ATI Events Daemon launcher
install -m755 "${srcdir}/atieventsd.sh" "${pkgdir}/etc/rc.d/atieventsd" || return 1

# thanks to cerebral, we dont need that damned symlink
install -m755 "${srcdir}/catalyst.sh" "${pkgdir}/etc/profile.d/" || return 1

# License
install -m644 "${srcdir}/archive_files/ATI_LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1
}



