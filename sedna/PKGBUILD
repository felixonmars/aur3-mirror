# Mantainer: Alex Reznichenko
# Mantainer: Gianni Vialetto <g dot vialetto at gmail dot com>

pkgname=sedna
pkgver=3.4.66
pkgrel=1
pkgdesc="A free native XML database"
arch=('i686' 'x86_64')
url="http://modis.ispras.ru/sedna"
license=('APACHE')
depends=('cmake')
source=("http://www.modis.ispras.ru/FTPContent/sedna/current/sedna-${pkgver}-src-linux.tar.gz" 
        "sedna.rc" "sedna.conf" "sedna-indexes.patch")
install=('sedna.install')
md5sums=('fcc11f1777fd553e38caf102ae3c25ec'
         'b01f9744893dc205f2e07be6f6c47006'
         'd5e55093f27b654506a88aec2e2ccee5'
         '09392530d684b451f0e75a58c6a4f986')

build() {

    cd ${srcdir}
    # GCC 4.5 does not like sedna...
    patch sedna-${pkgver}/kernel/tr/idx/indexes.cpp sedna-indexes.patch
    mkdir build
    cd build
        
    # Build
    cmake ../sedna-${pkgver} -DCMAKE_INSTALL_PREFIX=${pkgdir}/opt/sedna || return 1
    make
    
    # Install
    make install || return 1
    mkdir -p ${pkgdir}/usr/bin
    ln -sfv ${pkgdir}/opt/sedna/bin/se_* ${pkgdir}/usr/bin
    install -D -m755 ${srcdir}/sedna.rc ${pkgdir}/etc/rc.d/sedna
    install -D -m755 ${srcdir}/sedna.conf ${pkgdir}/etc/conf.d/sedna
}
