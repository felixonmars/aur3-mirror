# This script is incomplete and in development. To install bumblebee use the one in the AUR
# http://aur.archlinux.org/packages.php?ID=49469

# Maintainer: Samsagax <samsagax@gmail.com>

pkgname=bumblebee-develop-git
pkgver=20110809
pkgrel=1
pkgdesc="Develop branch of Bumblebee-Project. USE ONLY AS DIRECTED! Optimus Support for Linux Through VirtualGL. Power management not supported"
arch=('i686' 'x86_64')
depends=('virtualgl-bin' 'dkms-nvidia' 'nvidia-utils-bumblebee')
#optdepends=('acpi_call: turn on/off discrete card (unstable)')
if [ "$CARCH" = "x86_64" ]; then
     optdepends[0]='lib32-nvidia-utils-bumblebee: run 32bit applications with optirun'
fi
url="https://github.com/Bumblebee-Project/Bumblebee"
license=("GPL3")
install=('bumblebee.install')
conflicts=("bumblebee-nouveau" 'bumblebee')
provides=('bumblebee')

_gitroot="git://github.com/Bumblebee-Project/Bumblebee.git"
_gitname="Bumblebee"
_gitbranch="develop"

_config_dir=etc/bumblebee
_bin_dir=usr/bin
_lib_dir=usr/lib

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot -b $_gitbranch $_gitname --depth=1
    fi

    msg "GIT checkout done or server timeout"

}

package() {
    local _config_dir=$pkgdir/etc/bumblebee
    local _bin_dir=$pkgdir/usr/bin/
    local _lib_dir=$pkgdir/usr/lib/bumblebee
    local _install_dir=$pkgdir/usr/share/bumblebee
    
    cd $srcdir/$_gitname/install-files
    
    # Installing Bumblebee scripts
    install -d -m755 "$_bin_dir"
    install -d -m755 "$_config_dir"
    install -d -m755 "$_lib_dir"
    install -d -m755 "$_install_dir"
    
    install -m755 common-functions "$_lib_dir"
    install -m755 common-paths "$_lib_dir"
    install -D -m755 drivers/nvidia.options.archlinux "$_lib_dir/drivers/nvidia.options"
    install -D -m755 bumblebee.handler $pkgdir/etc/rc.d/bumblebee
    install -m755 bumblebee "$_bin_dir"
    install -m755 optirun "$_bin_dir"
    #install -D -m755 bumblebee.handler $pkgdir/etc/rc.d/bumblebee
    
    # Config files
    install -D -m644 xorg.conf.nvidia "$_config_dir"
    install -D -m644 bumblebee.conf "$_config_dir"
  
    # Bash completion
    install -D -m644 optirun.bash_completion $pkgdir/etc/bash_completion.d/optirun
}





















