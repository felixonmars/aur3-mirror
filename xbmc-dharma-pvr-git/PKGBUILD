# Mantainer: Andremosfet <andrejfet[at]hotmail.it>
# Based to DonVla's "xbmc-git" PKBUILD

pkgname=xbmc-dharma-pvr-git
pkgver=20110522
#_commit=94e66f31c62ec0247f0f
# 10.0-Dharma release commit
#_commit=611667525bf7016c5f3c
pkgrel=1
pkgdesc="XBMC Media Center with support PVR (VDR,Tvheadend ecc..) - git development version"
provides=('xbmc')
conflicts=('xbmc' 'xbmc-pulse' 'xbmc-svn' 'xbmc-pvr-testing')
replaces=('xbmc-svn')
arch=('i686' 'x86_64')
url="https://github.com/opdenkamp/xbmc"
license=('GPL' 'LGPL')
depends=('bzip2' 'faac' 'faad2' 'fribidi' 'glew' 'jasper' 'libass' 'libcdio' 'libgl' 'libmad' 'libmms' 
         'libmicrohttpd' 'libmodplug' 'libmpeg2' 'libmysqlclient' 'libsamplerate' 'libxrandr' 'libxinerama' 
         'libxtst' 'lzo2' 'sdl_image>=1.2.10' 'sdl_mixer' 'smbclient' 'unzip' 'wavpack' 'mesa-demos' 'xorg-xdpyinfo')
makedepends=('boost' 'cmake' 'git' 'gperf' 'nasm' 'python2' 'zip' 'libvdpau' 'udisks' 'upower' 'unrar')
optdepends=('avahi: to use zerconf features (remote, etc...)' 
            'gdb: for meaningful backtraces in case of trouble - STRONGLY RECOMMENDED' 
            'libssh: support for sshfs'
            'libva: accelerated video playback for nvidia, ati/amd and some intel cards'
            'lirc: remote controller support' 
            'pulseaudio: pulseaudio support')
options=('makeflags')
install="${pkgname}.install"
source=("FEH.sh") 
md5sums=('5c09caddbf02b07c09a05bbaf7894ee6')

_gitroot="https://github.com/opdenkamp/xbmc.git"
_gitname="xbmc"
_prefix=/usr

build() {
    cd "${srcdir}"
    msg "Connecting to GIT server...."

    if [ -d ${_gitname} ] ; then
        cd ${_gitname} && git pull origin
        msg "The local files are updated."
        msg "Running make distclean"
        make distclean || :
    else
        git clone ${_gitroot} ${_gitname}
    fi

    # Configure XBMC
    cd "${srcdir}/${_gitname}"

    # fix lsb_release dependency
    sed -i -e 's:/usr/bin/lsb_release -d:cat /etc/arch-release:' xbmc/utils/SystemInfo.cpp

    # remove "--as-needed" from LDFLAGS
    unset LDFLAGS; LDFLAGS="-Wl,--hash-style=gnu"

    msg "Bootstrapping XBMC"
    ./bootstrap

    msg "Configuring XBMC" 
 	export PYTHON_VERSION=2    
	./configure --prefix="${_prefix}" --disable-hal \
                --enable-vdpau \
		--enable-external-libraries \
                --disable-external-ffmpeg \
                --enable-debug

    # Now build
    msg "Running make" 
    make ${MAKEFLAGS}
    make -C lib/addons/script.module.pil
}

package() {

    cd "${srcdir}/${_gitname}"
    msg "Running make install" 
    make prefix="${pkgdir}${_prefix}" install

# Replace FEH.py with FEH.sh (and thus remove external python dependency)
    install -D -m 0755 "${srcdir}/FEH.sh" "${pkgdir}${_prefix}/share/xbmc/FEH.sh"
    sed -i -e 's/^python \(.*\)FEH.py \(.*\)$/\1FEH.sh \2/' "${pkgdir}${_prefix}/bin/xbmc"

# lsb_release fix
    sed -i -e 's/which lsb_release &> \/dev\/null/\[ -f \/etc\/arch-release ]/g' "${pkgdir}${_prefix}/bin/xbmc"
    sed -i -e "s/lsb_release -a 2> \/dev\/null | sed -e 's\/\^\/    \/'/cat \/etc\/arch-release/g" "${pkgdir}${_prefix}/bin/xbmc"

# .desktop files
    install -D -m 0644 "${srcdir}/${_gitname}/tools/Linux/xbmc.desktop" "${pkgdir}${_prefix}/share/applications/xbmc.desktop"
    install -D -m 0644 "${srcdir}/${_gitname}/tools/Linux/xbmc-48x48.png" "${pkgdir}${_prefix}/share/pixmaps/xbmc.png"

# Tools
    install -D -m 0755 "${srcdir}/${_gitname}/xbmc-xrandr" "${pkgdir}${_prefix}/share/xbmc/xbmc-xrandr"
    install -D -m 0755 "${srcdir}/${_gitname}/tools/TexturePacker/TexturePacker" "${pkgdir}${_prefix}/share/xbmc/"

# Licenses
    install -d -m 0755 "${pkgdir}${_prefix}/share/licenses/${pkgname}" 
    for licensef in LICENSE.GPL copying.txt; do 
        mv "${pkgdir}${_prefix}/share/doc/xbmc/${licensef}" "${pkgdir}${_prefix}/share/licenses/${pkgname}" 
    done 

# Docs 
    install -d -m 0755 "${pkgdir}${_prefix}/share/doc/${pkgname}" 
    for docsf in keymapping.txt README.linux; do 
        mv "${pkgdir}${_prefix}/share/doc/xbmc/${docsf}" "${pkgdir}${_prefix}/share/doc/${pkgname}" 
     done

# cleanup some stuff
    msg "Cleanup unneeded files"
    rm -rf "${pkgdir}/usr/share/xsessions"
    rm -f "${pkgdir}/usr/share/xbmc/FEH.py"
    rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"

# strip
    msg "Stripping binaries"
    find "${pkgdir}" -type f -exec strip {} \; >/dev/null 2>/dev/null
}
