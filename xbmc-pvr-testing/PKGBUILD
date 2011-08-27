# Contributor:Andremosfet <andrejfet at hotmail dot it>

pkgname=xbmc-pvr-testing
pkgver=35160
pkgrel=1
pkgdesc="XBMC Media Center with PVR support (VDR ecc..)"
arch=('i686' 'x86_64')
url="https://xbmc.svn.sourceforge.net/svnroot/xbmc/branches/pvr-testing2/"
license=('GPL' 'LGPL')
depends=('bzip2' 'faac' 'faad2' 'fribidi' 'glew' 'jasper' 'libass' 'libcdio' 'libgl' 'libmad' 
         'libmicrohttpd-xbmc' 'libmms' 'libmodplug' 'libmpeg2' 'libmysqlclient' 'libsamplerate' 'libxinerama' 
         'libvpx' 'libxtst' 'lzo2' 'sdl_image>=1.2.10' 'sdl_mixer' 'smbclient' 'unzip' 'wavpack'
         'libva' 'libssh' 'udisks' 'upower' 'libvdpau' 'unrar' 'avahi' 'lsb-release'
         'rtmpdump' 'openssl')
makedepends=('cvs' 'boost' 'cmake' 'gperf' 'nasm' 'subversion' 'zip' 'python2')
optdepends=('gdb: for meaningful backtraces in case of trouble - STRONGLY RECOMMENDED' 
            'lirc: remote controller support')
provides=('xbmc')
conflicts=('xbmc' 'xbmc-crystalhd' 'xbmc-trunk')
install=("${pkgname}.install")
source=(FEH.sh)
md5sums=('c3e2ab79b9965f1a4a048275d5f222c4')

_svnmod=XBMC
_prefix=/usr

build() {
  #MAKEFLAGS="-j1"

  _svntrunk=https://xbmc.svn.sourceforge.net/svnroot/xbmc/branches/pvr-testing2/
 cd "${srcdir}/"
    if [ -d "$_svnmod/.svn" ]; then
        msg "SVN tree found, reverting changes and updating to -r$pkgver"
        (cd "$_svnmod" && svn revert -R . && (make distclean || :); svn up -r "$pkgver")
    else
        msg "Checking out SVN tree of -r$pkgver"
        svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
    fi

    # Configure XBMC
    #
    # Note on external-libs:
    #   - We cannot use external python because Arch's python was built with
    #     UCS2 unicode support, whereas xbmc expects UCS4 support
    cd "${srcdir}/${_svnmod}"

    # Archlinux Branding by SVN_REV
    export SVN_REV="${pkgver}-ARCH"
    # fix lsb_release dependency
    sed -i -e 's:/usr/bin/lsb_release -d:cat /etc/arch-release:' xbmc/utils/SystemInfo.cpp

    # remove "--as-needed" from LDFLAGS
    unset LDFLAGS; LDFLAGS="-Wl,--hash-style=gnu"

    msg "Bootstrapping XBMC"
    ./bootstrap

    msg "Configuring XBMC" 
    ./configure --prefix="${_prefix}" --disable-hal \
                --enable-webserver \
                --enable-debug \
	        --enable-vdpau \
                --enable-vaapi \
                --enable-dvdcss \
                --disable-external-libraries \
                --disable-external-ffmpeg \
                --disable-external-python || return 1
			

    # Now (finally) build
    msg "Running make" 
    make
    make -C lib/addons/script.module.pil
    make -C lib/addons/script.module.pysqlite
}

package() {

    cd "${srcdir}/${_svnmod}"
    msg "Running make install" 
    make prefix="${pkgdir}${_prefix}" install

# Replace FEH.py with FEH.sh (and thus remove external python dependency)
    install -D -m 0755 "${srcdir}/FEH.sh" "${pkgdir}${_prefix}/share/xbmc/FEH.sh"
    sed -i -e 's/^python \(.*\)FEH.py \(.*\)$/\1FEH.sh \2/' "${pkgdir}${_prefix}/bin/xbmc"

# lsb_release fix
    sed -i -e 's/which lsb_release &> \/dev\/null/\[ -f \/etc\/arch-release ]/g' "${pkgdir}${_prefix}/bin/xbmc"
    sed -i -e "s/lsb_release -a 2> \/dev\/null | sed -e 's\/\^\/    \/'/cat \/etc\/arch-release/g" "${pkgdir}${_prefix}/bin/xbmc"

# .desktop files
    install -D -m 0644 "${srcdir}/${_svnmod}/tools/Linux/xbmc.desktop" "${pkgdir}${_prefix}/share/applications/xbmc.desktop"
    install -D -m 0644 "${srcdir}/${_svnmod}/tools/Linux/xbmc-48x48.png" "${pkgdir}${_prefix}/share/pixmaps/xbmc.png"

# Tools
    install -D -m 0755 "${srcdir}/${_svnmod}/xbmc-xrandr" "${pkgdir}${_prefix}/share/xbmc/xbmc-xrandr"
    install -D -m 0755 "${srcdir}/${_svnmod}/tools/TexturePacker/TexturePacker" "${pkgdir}${_prefix}/share/xbmc/"

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
    find "$pkgdir" -type f -exec strip {} \; >/dev/null 2>/dev/null
}  	  	 
