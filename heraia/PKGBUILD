pkgname=heraia
pkgver=0.1.7
_ghexver=2.24.0
pkgrel=2
pkgdesc="Edit all sorts of files viewing them in an hexadecimal manner"
arch=('i686' 'x86_64')
url='http://gna.org/projects/heraia/'
license=('GPL')
depends=('gtk2' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'intltool' 'gnome-doc-utils' 'libgnomeui' 'libgnomeprintui')
options=('!libtool')
install=heraia.install
source=(http://download.gna.org/$pkgname/releases/$pkgname-$pkgver.tar.gz http://ftp.gnome.org/pub/GNOME/sources/ghex/2.24/ghex-${_ghexver}.tar.bz2)
sha256sums=('4b008b99c54571569f5c7f2cfa105818e63da64289df7406010c67c15ae59137' 'df0e1a01472a99b9e94236ab1200108e10829d99c030f8422288323448762e2e')

build() {
	cd "${srcdir}/ghex-${_ghexver}"
	
	./configure --prefix="${srcdir}/ghex-${_ghexver}/gtkhex" --sysconfdir="${srcdir}/ghex-${_ghexver}/etc" \
      --localstatedir="${srcdir}/ghex-${_ghexver}/var" --disable-static \
      --disable-schemas-compile
      
    make
    
    make install
            
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    PKG_CONFIG_PATH="../ghex-${_ghexver}/" ./configure --prefix=/usr --disable-static
    
    sed -i 's/gtkhex\/gtkhex.h/gtkhex.h/g' libheraia/include/libheraia.h
    
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    cp "${srcdir}/ghex-${_ghexver}/gtkhex/lib/libgtkhex.so.0" "${pkgdir}/usr/lib/heraia/"
}
