# mantainter: Franco Tortoriello <franco DOT tortoriello AT gmail DOT com>
# qemu-kvm maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=qemu-kvm-opensuse
_qemuver=0.14.0
_osuserel=74.1
pkgver=${_qemuver}_${_osuserel}
pkgrel=1
pkgdesc="KVM QEMU with OpenSUSE patches."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://www.linux-kvm.org"
depends=('libjpeg' 'libpng' 'libsasl' 'curl' 'sdl' 'alsa-lib' 'esound' 'gnutls>=2.4.1' 'bluez' 'vde2' 'util-linux-ng' 'zlib')
makedepends=('texi2html' 'perl' 'dev86' 'iasl' 'quilt' 'rpm-org' 'cpio' 'python2')
backup=('etc/qemu/target-x86_64.conf')
install=${pkgname}.install
conflicts=('qemu' 'qemu-kvm')
provides=('qemu' 'qemu-kvm')
replaces=('kvm' 'kvm-opensuse')
source=("http://download.opensuse.org/repositories/Virtualization/openSUSE_Factory/src/kvm-${_qemuver}.0-${_osuserel}.src.rpm"
	'65-kvm.rules')

build()
{
  cd ${srcdir}
  bsdtar xf kvm-${_qemuver}.0-${_osuserel}.src.rpm
  tar xvvjf qemu-kvm-${_qemuver}.tar.bz2

  msg2 "Preparing patches"
  cat kvm.spec |sed '/Name:/i %define suse_version 1130\n' > kvm_nosuse.spec
  quilt -v setup kvm_nosuse.spec

  # Use Python 2
  sed -e 's|bin/python|bin/python2|' -e 's|env python|env python2|' -i $(find . -name '*.py')

  msg2 "Patching"
  cd qemu-kvm-${_qemuver}
  cp -a roms/seabios/ roms/seabios-mac
  quilt push -a -v

  msg2 "Configuring"
  # fix esound building
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--audio-drv-list=alsa,sdl,oss,esd \
	--audio-card-list=ac97,sb16,es1370,adlib \
	--enable-docs

  msg2 "Making"
  make
  # Mac BIOS
  #cd roms/seabios-mac
  #make		#broken
}

package() {
  msg2 "Installing"
  cd ${srcdir}/qemu-kvm-${_qemuver}
  make DESTDIR=${pkgdir} install

  # Mac BIOS
  #install ${srcdir}/qemu-kvm-${_qemuver}/roms/seabios-mac/out/bios.bin ${pkgdir}/usr/share/qemu-kvm/bios-mac.bin
  # symbolic link for backwards compatibility
  ln -s qemu-system-x86_64 ${pkgdir}/usr/bin/qemu-kvm
  # symbolic link to qemu binary for emulator apps
  ln -s qemu-system-x86_64 ${pkgdir}/usr/bin/qemu
  ln -s qemu-system-x86_64 ${pkgdir}/usr/bin/kvm
  # fix man page
  mv ${pkgdir}/usr/share/man/man1/qemu.1 \
	${pkgdir}/usr/share/man/man1/qemu-kvm.1
  # install udev rules
  install -D -m644 ${srcdir}/65-kvm.rules \
	${pkgdir}/lib/udev/rules.d/65-kvm.rules
}

md5sums=('3d93019f6dbb9aac29fff1af024efaad'
         'b316a066d2f1bb57d8f5b7ea1d0d1caf')
