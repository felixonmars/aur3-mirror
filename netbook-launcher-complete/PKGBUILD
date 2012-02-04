# Maintainer: SebLemieux 
pkgname=netbook-launcher-complete
pkgver=2.1.18
pkgrel=1
pkgdesc="(for Gnome 2.30) Netbook-launcher from Ubuntu UNR. Replace the normal menu launcher. To use with go-home-applet, 
window-picker-applet and maximus"
arch=('i686' 'x86_64')
depends=('libgnome>=2.30' 'gnome-menus>=2.30' 'gnome-desktop>=2.30')
url="https://launchpad.net/netbook-remix-launcher"
makedepends=('binutils')
provides=('netbook-launcher=2.17' 'liblauncher=0.1.10' 'libnetbook-launcher=2.17' 'clutk=0.2.14' 'clutter=1.2.4' 
'clutter-gtk=0.10.4')
conflicts=('netbook-launcher' 'clutk' 'clutter' 'clutter-gtk')
replaces=('netbook-launcher' 'liblauncher' 'libnetbook-launcher' 'clutk' 'clutter' 'clutter-gtk')
license=('GPL')

_source_x86=(
	https://launchpad.net/ubuntu/+source/clutter-1.0/1.2.4-0ubuntu1/+build/1580900/+files/gir1.0-clutter-1.0_1.2.4-0ubuntu1_i386.deb
	http://mirrors.kernel.org/ubuntu/pool/universe/c/clutter-gtk-0.10/gir1.0-clutter-gtk-0.10_0.10.4-0ubuntu1_i386.deb
	http://mirrors.kernel.org/ubuntu/pool/main/c/clutk/libclutk-0.2-0_0.3.8.is.0.2.14-0ubuntu1_i386.deb
	http://mirrors.kernel.org/ubuntu/pool/main/c/clutter-1.0/libclutter-1.0-0_1.2.4-0ubuntu1_i386.deb
	http://mirrors.kernel.org/ubuntu/pool/main/c/clutter-gtk-0.10/libclutter-gtk-0.10-0_0.10.4-0ubuntu1_i386.deb
	http://mirrors.kernel.org/ubuntu/pool/main/libl/liblauncher-0.1/liblauncher-0.1-0_0.1.10-0ubuntu1_i386.deb
	http://mirrors.kernel.org/ubuntu/pool/main/n/netbook-launcher/libnetbook-launcher-0_${pkgver}-0ubuntu2_i386.deb
    	http://mirrors.kernel.org/ubuntu/pool/main/n/netbook-launcher/netbook-launcher_${pkgver}-0ubuntu2_i386.deb    
)
_md5sums_x86=(
    	'5051b7017ce88119cf23ba390362bb4d'
	'75a0c62a3e0103854aa6ec72934aad8a'
	'93fe189dfe9879198ebce7baae79ed80'
	'a98c4b0dbb4304b515a58ac04063f77e'
	'592b4ce73e25963f61ec2c98195d8048'
	'8d2b3c9a74fa143630fcacf70629cf11'
	'19b5bbaab2d621033e328ab50cfc1141'
	'df9e64f81ac84cd46ab1b95b69d6c2c9'
)

_source_x86_64=(
	http://mirrors.kernel.org/ubuntu/pool/main/c/clutter-1.0/gir1.0-clutter-1.0_1.2.4-0ubuntu1_amd64.deb
	http://mirrors.kernel.org/ubuntu/pool/universe/c/clutter-gtk-0.10/gir1.0-clutter-gtk-0.10_0.10.4-0ubuntu1_amd64.deb
	http://mirrors.kernel.org/ubuntu/pool/main/c/clutk/libclutk-0.2-0_0.3.8.is.0.2.14-0ubuntu1_amd64.deb
	http://mirrors.kernel.org/ubuntu/pool/main/c/clutter-1.0/libclutter-1.0-0_1.2.4-0ubuntu1_amd64.deb
	http://mirrors.kernel.org/ubuntu/pool/main/c/clutter-gtk-0.10/libclutter-gtk-0.10-0_0.10.4-0ubuntu1_amd64.deb
	http://mirrors.kernel.org/ubuntu/pool/main/libl/liblauncher-0.1/liblauncher-0.1-0_0.1.10-0ubuntu1_amd64.deb
	http://mirrors.kernel.org/ubuntu/pool/main/n/netbook-launcher/libnetbook-launcher-0_${pkgver}-0ubuntu2_amd64.deb
    	http://mirrors.kernel.org/ubuntu/pool/main/n/netbook-launcher/netbook-launcher_${pkgver}-0ubuntu2_amd64.deb   
)
_md5sums_x86_64=(
 	'f56808fa1a37279f234671f5fafb94bd'
	'8899827f6a2821932bea389d994bf45c'
	'7d4e524a96ce634809b0ac87bc715dcf'
	'e042b3364a37db8df506208a6c445096'
	'c5cda66fbbc3591ec50683b99b9bda91'
	'dda758841c246c3123880cd41a553e92'
	'64793c723592c009e06563e507c4046f'
	'45e3ad969c40910696b26047c7611782'
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
  ar x gir1.0-clutter-1*.deb
  tar -xzvf data.tar.gz -C data || return 1
  ar x gir1.0-clutter-gtk*.deb
  tar -xzvf data.tar.gz -C data || return 1  
  
  # Modify autostart
  cp -r data/etc/xdg/xdg-une/autostart/ data/etc/xdg/ && rm -r data/etc/xdg/xdg-une/

  #Copy into place
  cp -r data/* $pkgdir || return 1  
}
