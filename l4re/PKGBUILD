# Mantainer Andrei Zaikin (andzai1995@gmail.com)

pkgbase=l4re
pkgname=${pkgbase}-svn

pkgver=3.14

pkgdesc="L4 microkernel base services and applications"
depends=('coreutils' 'fiasco-svn')
optdepends=('crda: to set the correct wireless channels of your country')

pkgrel=3
url="http://os.inf.tu-dresden.de/L4Re/"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('gcc48' 'perl' 'binutils' 'subversion' 'make' 'gawk' 'pkg-config' 'swig') 

#http://os.inf.tu-dresden.de/download/snapshots-oc/
#configs = Arch linux configs + ACPI and PM removed
source=('kconfig.64' 'kconfig.32' 'makepkg.conf')

md5sums=('fde9c4da94032157d72ba0b7d0252c24'\
 '6feb00bf4693cb593d1711a4d2bd50ea'\
 '2748401b8e1fc2c7ebc1af996d659349')

export KARCH=x86


prepare() {
	#decide on which configs to use
	if [ ${CARCH} == x86_64 ]; then
	  _l4reconf=${srcdir}/kconfig.64
	else
	  _l4reconf=${srcdir}/kconfig.32
	fi
	_src="${srcdir}/${pkgname}/src"

	msg "backing up your makepkg and gcc settings"
	msg "backing up makepkg settings"
	sudo mv /etc/makepkg.conf /etc/makepkg.conf.backup
	msg "backing up gcc"
	for i in gcc g++ cpp c++; do
	  sudo mv -v /usr/bin/$i /usr/bin/$i.backup 
	  sudo ln -sv /usr/bin/$i-4.8 /usr/bin/$i;
	done	
	msg "getting sources"
	mkdir -p ${srcdir}/${pkgname}
	cd ${srcdir}/${pkgname}
	svn cat http://svn.tudos.org/repos/oc/tudos/trunk/repomgr | perl - init http://svn.tudos.org/repos/oc/tudos l4re l4linux_requirements
	cd src/l4/pkg
	svn up acpica drivers fb-drv input io libevent libio-io libgfortran libirq libvcpu lxfuxlibc mag mag-gfx rtc shmc x86emu zlib
	
	msg "prepare L4Re"
	cd ${_src}/l4
	rm -rf ${srcdir}/build/l4re
	make B=${srcdir}/build/l4re
	cp ${_l4reconf} ${srcdir}/build/l4re/.kconfig
	make O=${srcdir}/build/l4re oldconfig
	make O=${srcdir}/build/l4re menuconfig
}

build() {
	msg "build L4Re"
	cd ${srcdir}/build/l4re
	make O=${srcdir}/build/l4re
}

package() {
	msg "restoring your settings"
	msg "restoring gcc"
	for i in gcc g++ cpp c++; do
	  sudo rm -v /usr/bin/$i 
	  sudo mv -v /usr/bin/$i.backup /usr/bin/$i;
	done
	msg "restoring makepkg settings"
	sudo rm -v /etc/makepkg.conf
	sudo mv -v /etc/makepkg.conf.backup /etc/makepkg.conf
	msg "package L4Re"
	mkdir -p ${pkgdir}/boot/l4/
	cp -r ${srcdir}/build/l4re/* ${pkgdir}/boot/l4/
}
