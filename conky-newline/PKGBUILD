# Patch conky to treat mutliline exec output the same as regular text 

# Unpatched conky will substitute all but the last 
# '\n' character in exec output with instances of "SECRIT_MULTILINE_CHAR"

# Here there is no substitution

# Exec output can that includes multiple align* variables 
# will now work as expected. 


# If exec output is being cut off prematurely try
# setting the "text_buffer_size" config variable to something > 256


pkgname=conky-newline
_pkgname=conky
pkgver=1.8.1
pkgrel=2
pkgdesc='An advanced, highly configurable system monitor for X based on torsmo, with lua bindings enabled. Patched to allow multiple align directives in lengthy exec output.'
arch=('i686' 'x86_64')
url='http://conky.sourceforge.net/'
license=('custom')
replaces=('torsmo')
depends=('alsa-lib' 'libxml2' 'curl' 'wireless_tools' 'libxft' 'glib2' 'libxdamage' 'imlib2' 'lua' 'cairo')
makedepends=('pkgconfig' 'toluapp')
provides=('conky=1.8.1')
conflicts=('conky')
backup=('etc/conky/conky.conf' 'etc/conky/conky_no_x11.conf')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz" \
            ${_pkgname}-${pkgver}.patch)
sha1sums=('06bbe9b7eed8603fa7a971b27c5c61f38424ac6f'
          '0f78afa15ba61eca4a14e52d62692f1ed053f317')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-wlan \
        --enable-rss \
        --enable-ibm \
        --enable-imlib2 \
        --enable-lua \
        --enable-lua-cairo \
        --enable-lua-imlib2 \
        --enable-debug=yes \
        --enable-alsa=yes \
        --enable-weather-xoap 
    make
}

package() {
    cd "${srcdir}"
    patch -p0 -i "${_pkgname}-${pkgver}.patch"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
