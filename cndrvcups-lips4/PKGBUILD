# Maintainer: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Tomohiro Takezawa <khabus {at} gmail.com>

pkgbase='cndrvcups-lips4'
pkgname=('cndrvcups-lips4')
pkgver=2.90
pkgrel=2
pkgdesc="Canon LIPS4 driver for some LBP and iR series printer, built from source"
arch=(x86_64)
license=('GPL2' 'custom')
url="http://cweb.canon.jp/drv-upd/lasershot/linux/lipssource.html"
depends=('cndrvcups-lips4-cpca=2.90-2' 'lib32-glibc' 'libglade')
source=(linux-lips4-sources-v290.tar.gz::'http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwNDE2MzA3&cmp=ACM&lang=EN')
options=('!emptydirs' '!strip' '!libtool')
sha512sums=('4ce320662f104aef94608d9cdb2f65d6def825d8e9e514f588a1a54fa4d87576c76dfe0a64300215de77cd66a3d26fb727dc552a18f55b3448acc06a34fdb721')

# build instructions are adapted from upstream cndrvcups-lips4.spec file

prepare() {
    cd "${srcdir}"/linux-lips4-sources-v290/Sources
    tar xf "${pkgbase}"-"${pkgver}"-1.tar.gz -C "${srcdir}"
}

package() {

    cd "${srcdir}"/"${pkgbase}"-"${pkgver}"/driver
    autoreconf -fi
    ./autogen.sh --prefix=/usr --libdir=/usr/lib

    cd "${srcdir}"/"${pkgbase}"-"${pkgver}"/pstolipscpca
    autoreconf -fi
    ./autogen.sh --prefix=/usr --libdir=/usr/lib --enable-progpath=/usr/bin

    cd "${srcdir}"/"${pkgbase}"-"${pkgver}"/ppd
    autoreconf -fi
    ./autogen.sh --prefix=/usr 

    cd "${srcdir}"/"${pkgbase}"-"${pkgver}"/cngplp
    autoreconf -fi
    ./autogen.sh --prefix=/usr libdir=/usr/lib

    cd files
    autoreconf -fi
    ./autogen.sh --prefix=/usr

    cd "${srcdir}"/"${pkgbase}"-"${pkgver}"
    mkdir -p "${pkgdir}"/usr/{bin,include,lib/cups/filter,share/{cngplp,cups/model}}

    for _dir in driver pstolipscpca ppd cngplp 
    do
      echo "compiling modules ${_dir} ..."
      cd "${srcdir}"/"${pkgbase}"-"${pkgver}"/"${_dir}"
      make
    done
   
    for _dir in driver pstolipscpca ppd cngplp 
    do
      echo "Installing modules ${_dir} ..."
      cd "${srcdir}"/"${pkgbase}"-"${pkgver}"/"${_dir}"
      make install DESTDIR="${pkgdir}"
    done

    cd "${srcdir}"/"${pkgbase}"-"${pkgver}"
    install -c -m 4755 libs/cnpkmodulelips "${pkgdir}"/usr/bin
    
    install -m755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    install -m644 LICENSE-lips4-"${pkgver}".txt "${pkgdir}"/usr/share/licenses/"${pkgname}"
    install -m755 -d "${pkgdir}"/usr/share/doc/"${pkgname}"
    install -m644 "${srcdir}"/linux-lips4-sources-v290/Documents/guide-lips4-2.9x.tar.gz "${pkgdir}"/usr/share/doc/"${pkgname}"/guide-lips4-2.9x.tar.gz
}
