# Contributor: joyfulgirl <joyfulgirl (at) archlinux (dot) us>

pkgname=9base-hg
pkgver=76
pkgrel=1
pkgdesc="Port of various original Plan9 tools to unix"
url="http://suckless.org"
conflicts=('plan9port' '9rc-devel' '9base')
provides=('plan9')
arch=('i686' 'x86_64')
license=('custom')
changelog=ChangeLog
source=('9' 'plan9.sh')
md5sums=('ae7108b9f26bed388e9055f35eef2986'
         '62a9e52043d9c32967fcae9018fffb56')

_hgroot="http://hg.suckless.org/"
_hgrepo="9base"

build()
{
    msg "Connecting to $_hgroot"
    if [ -d $_hgrepo ]; then
        cd $_hgrepo
        hg pull -u || return 1
        msg2 "Finished updating the local repository!"
    else
        hg clone ${_hgroot}/${_hgrepo} "${srcdir}/${_hgrepo}" || return 1
        msg2 "Initial pull complete!"
    fi

    if [ -d "${srcdir}/${_hgrepo}-build" ]; then
        cd "${srcdir}/${_hgrepo}-build"
        make clean || return 1
        hg pull -u "${srcdir}/${_hgrepo}" || return 1
    else
        hg clone "${srcdir}/${_hgrepo}" "${srcdir}/${_hgrepo}-build" || return 1
        cd "${srcdir}/${_hgrepo}-build"
    fi

    case $CARCH in
        i686) sed -i 's#^OBJTYPE\s.*$#OBJTYPE = 386#' config.mk ;;
        x86_64) sed -i 's#^OBJTYPE\s.*$#OBJTYPE = x86_64#' config.mk ;;
	esac

    sed -i 's#^PREFIX\s.*$#PREFIX = /opt/plan9#' config.mk

    make || return 1
}

package() {
    cd "${srcdir}/${_hgrepo}-build"
    make DESTDIR="$pkgdir" install || return 1
    install -m755 "${srcdir}/9" "${pkgdir}/opt/plan9/bin/" || return 1
    install -d -m755 "$pkgdir/etc/profile.d/" || return 1
    install -m755 "${srcdir}/plan9.sh" "$pkgdir/etc/profile.d/" || return 1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/9base/LICENSE" || return 1
}

# End of file
