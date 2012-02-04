# contributor Carlos salvador <safe harmonics at g mail dot com>
#contributor: Tom Billiet

pkgname=nforce-nvsound-utils
pkgver=1.0.0310
_nver=1.0-0310
pkgrel=2
pkgdesc="The Nvidia nforce utilities"
arch=('i686' 'x86_64')
url="http://www.nvidia.com"
depends=()
conflicts=(nforce-utils)
license=('custom: NVIDIA')
source=(ftp://download.nvidia.com/XFree86/nforce/${_nver}/NFORCE-Linux-x86-${_nver}-pkg1.run)
md5sums=('9e0b636ff53f4f23768383af962cc68c')

install="nforce.install"
build() {  
	cd $startdir/src/
	sh NFORCE-Linux-x86-${_nver}-pkg1.run --extract-only
	cd NFORCE-Linux-x86-${_nver}-pkg1
	mkdir -p $startdir/pkg/usr/{lib,bin}
	install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/nforce/LICENSE
	install -D -m755 nvsound/nvmix-reg $startdir/pkg/usr/bin/nvmix-reg 
	install -D -m755 nvsound/nvmixer $startdir/pkg/usr/bin/nvmixer
	install -D -m644 nvsound/lib/libnvalut.a  $startdir/pkg/usr/lib/libnvalut.a
	install -D -m644 nvsound/lib/libnvopenal.a $startdir/pkg/usr/lib/libnvopenal.a

	#desktop entry
	cd $startdir/src
	echo "[Desktop Entry]" > nvmixer.desktop
	echo "Name=nvmixer" >> nvmixer.desktop
	echo "Comment=Nvidia nforce mixer" >> nvmixer.desktop
	echo "Exec=nvmixer" >> nvmixer.desktop
	echo "Terminal=false" >> nvmixer.desktop
	echo "Type=Application" >> nvmixer.desktop
	echo "Categories=Application;AudioVideo;" >> nvmixer.desktop
  	
	install -D -m644 $startdir/src/nvmixer.desktop $startdir/pkg/usr/share/applications/nvmixer.desktop
 }
