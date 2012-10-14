# Maintainer: Jedipottsy

pkgname=razercfg-tool-git
pkgrel=2
pkgver=20121014
pkgdesc="The next generation Razer device configuration tool."
arch=(i686 x86_64)
url="http://dual.bues.ch/cms/hacking/razercfg.html"
license=('GPL')
source=('razercfg.desktop' 'razerd.initscript')
md5sums=()
depends=('python2' 'libusb' 'python2-qt')
makedepends=('git' 'cmake')
provides=('razercfg')
conflicts=('razercfg')
md5sums=('85017a8e0bfc7228851bc93930b8a226'
         '5a5f40a1182a0d784202f893972a001b')


_gitname="razer"
_gitroot="git://git.bues.ch/${_gitname}.git"


build() {
    
    cd ${srcdir}
    msg "Connecting to ${_gitroot} GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
        cd ${_gitname}
        git pull origin || return 1
        msg "The local files are updated."
    else
        git clone ${_gitroot} || return 1
    fi
    msg "GIT checkout done"
    msg "Starting make..."
    cd ${_gitname}
    sed 's|/usr/bin/env python|/usr/bin/python2|g' -i ui/{{q,}razercfg,pyrazer.py}
    sed 's/-O2/-O0/g' -i scripts/cmake.global
    cmake  -DCMAKE_INSTALL_PREFIX=/usr . || return 1
    make || return 1
    make DESTDIR="${pkgdir}" install || return 1
    install -m755 -d "${pkgdir}"/etc/rc.d || return 1
    install -m755 "${srcdir}/razerd.initscript" "${pkgdir}/etc/rc.d/razerd" || return 1
    install -m755 -d ${pkgdir}/usr/share/applications || return 1
    install -m644 $startdir/razercfg.desktop ${pkgdir}/usr/share/applications || return 1

    echo 
    echo 
    echo -------------------------------------------------------------
    echo 'Add "razerd" to the MODULES array in your "/etc/rc.conf"'
    echo -------------------------------------------------------------
    echo 
    echo 
}
