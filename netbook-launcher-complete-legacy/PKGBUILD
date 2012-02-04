# Contributor: LemieuxS <lems@gmx.fr>
pkgname=netbook-launcher-complete-legacy
pkgver=2.12
pkgrel=0
pkgdesc="(Gnome 2.28)Netbook-launcher from Ubuntu UNR. Replace the normal menu launcher. To use with go-home-applet, 
window-picker-applet and maximus"
arch=('i686' 'x86_64')
url="https://launchpad.net/netbook-remix-launcher"
depends=('libgnome<=2.28' 'gnome-menus<=2.28' 'gnome-desktop<=2.28')
makedepends=('binutils')
provides=('netbook-launcher' 'libclutk' 'libclutter' 'libclutter-gtk' 'liblauncher' 'libnetbook-launcher' 'clutk' 'clutter' 'clutter-gtk')
conflicts=('netbook-launcher' 'clutk' 'clutter' 'clutter-gtk')
replaces=('netbook-launcher' 'clutk' 'clutter' 'clutter-gtk')
license=('GPL')

_source_x86=(
	http://mirrors.kernel.org/ubuntu/pool/main/n/netbook-launcher/netbook-launcher_2.1.12-0ubuntu3_i386.deb
	http://mirrors.kernel.org/ubuntu/pool/main/c/clutk/libclutk-0.2-0_0.2.8-0ubuntu1_i386.deb
	http://mirrors.kernel.org/ubuntu/pool/main/c/clutter-1.0/libclutter-1.0-0_1.0.6-0ubuntu1_i386.deb
	http://mirrors.kernel.org/ubuntu/pool/main/c/clutter-gtk/libclutter-gtk-0.10-0_0.10.2-0ubuntu1_i386.deb
	http://mirrors.kernel.org/ubuntu/pool/main/libl/liblauncher/liblauncher-0.1-0_0.1.8-0ubuntu1_i386.deb
	http://mirrors.kernel.org/ubuntu/pool/main/n/netbook-launcher/libnetbook-launcher-0_2.1.12-0ubuntu3_i386.deb
)
_md5sums_x86=(
	'd6bc49645c911781640657c1d44dcef6'
	'0f13f433c2022ffb515bf1e688ba9e87'
	'b1f793a73e6eccfe561cc43af1be3d66'
	'700ba775a2e5a084432405ffca7b972d'
	'4c450b2798a26ec672c26987ee16db6a'
	'afd33dc489d5ea1d3cfa969f9429add9'
)

_source_x86_64=(
	http://mirrors.kernel.org/ubuntu/pool/main/n/netbook-launcher/netbook-launcher_2.1.12-0ubuntu3_amd64.deb
	http://mirrors.kernel.org/ubuntu/pool/main/c/clutk/libclutk-0.2-0_0.2.8-0ubuntu1_amd64.deb
	http://mirrors.kernel.org/ubuntu/pool/main/c/clutter-1.0/libclutter-1.0-0_1.0.6-0ubuntu1_amd64.deb
	http://mirrors.kernel.org/ubuntu/pool/main/c/clutter-gtk/libclutter-gtk-0.10-0_0.10.2-0ubuntu1_amd64.deb
	http://mirrors.kernel.org/ubuntu/pool/main/libl/liblauncher/liblauncher-0.1-0_0.1.8-0ubuntu1_amd64.deb
	http://mirrors.kernel.org/ubuntu/pool/main/n/netbook-launcher/libnetbook-launcher-0_2.1.12-0ubuntu3_amd64.deb
)
_md5sums_x86_64=(
	'5c80574e3c386edf4b502809493be356'
	'15aafb867ff310b444ab8cdc766249b8'
	'78f41d987d9156d71d9e54910f3101a5'
	'eff2c67c9cf5fa8892c7178951e7b5a7'
	'5c04772ef308949c56f2fd16c1fc8393'
	'88eec3cdff6f45e1a98fa532e1d9f674'
)

source=(${_source_x86[@]})
md5sums=(${_md5sums_x86[@]})
[ "$CARCH" = "x86_64" ] && source=(${_source_x86_64[@]})
[ "$CARCH" = "x86_64" ] && md5sums=(${_md5sums_x86_64[@]})

build() {
  cd $srcdir

  # extract the archive
  ar x netbook-launcher*.deb || return 1
  mkdir data
  tar -xzvf data.tar.gz -C data || return 1
  ar x liblauncher*.deb || return 1
  tar -xzvf data.tar.gz -C data || return 1
  ar x libnetbook-launcher*.deb
  tar -xzvf data.tar.gz -C data || return 1
  ar x libclutk*.deb
  tar -xzvf data.tar.gz -C data || return 1
  ar x libclutter-1*.deb
  tar -xzvf data.tar.gz -C data || return 1
  ar x libclutter-gtk*.deb
  tar -xzvf data.tar.gz -C data || return 1  
  
  # copy into place
  cp -r data/* $pkgdir || return 1  
}

