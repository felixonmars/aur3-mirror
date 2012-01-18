    # Maintainer: Kovivchak Evgen <oneonfire@gmail.com>
    # Contributor: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
     
    _pkgname="gnufdisk"
    pkgname="${_pkgname}"
     
    pkgver="2.0.0a1"
    pkgrel=1
    pkgdesc="GNU clone of util-linux fdisk utilities"
    arch=('i686' 'x86_64')
    url="https://www.gnu.org/software/fdisk/"
    license=('GPL3')
    makedepends=('guile')
    depends=('parted' 'ncurses' 'guile' 'libltdl')
    optdepends=()
    install="${pkgname}.install"
    # conflicts=("${_pkgname}")
    provides=('gnu-fdisk')
    replaces=('gnu-fdisk')
     
    source=("ftp://ftp.gnu.org/gnu/fdisk/${_pkgname}-${pkgver}.tar.gz"
                    "ftp://ftp.gnu.org/gnu/fdisk/${_pkgname}-${pkgver}.tar.gz.sig")
     
    sha256sums=('c963d84dff11c41210fff994742e9f90a72dfdcb0481bcc4b530223ed3511fb5'
                '974a2a21436a5e6161985a12f60d6c6275d52910cd112b9478ae36ef28b6128e')
     
    build() {
           
            cd "${srcdir}/${_pkgname}-${pkgver}/"
           
            mkdir -p "${srcdir}/${_pkgname}-${pkgver}/BUILD"
            cd "${srcdir}/${_pkgname}-${pkgver}/BUILD"
           
            echo
           
            CFLAGS="" ../configure --prefix="/usr" \
                                                            --bindir="/usr/bin" \
                                                            --sbindir="/usr/sbin" \
                                                            --mandir="/usr/share/man" \
                                                            --infodir="/usr/share/info" \
                                                            --sysconfdir="/etc"
           
            echo
           
            CFLAGS="" make
           
            echo
           
    }
     
    package() {
           
            cd "${srcdir}/${_pkgname}-${pkgver}/BUILD"
           
            echo
           
            make DESTDIR="${pkgdir}/" install
           
            echo
           
    }
