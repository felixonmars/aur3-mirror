pkgname=multispeech
pkgver=2.4.5
pkgrel=1
pkgdesc='Multilingual speech server for emacspeak'
arch=('i686' 'x86_64')
url='http://conky.sourceforge.net/'
license=('GPL')
depends=('libbobcat' 'boost-libs')
makedepends=('boost' 'portaudio_cpp' 'libsndfile')
backup=('etc/multispeech.conf')
source=("http://poretsky.homelinux.net/packages/ubuntu/pool/karmic/free/multispeech_2.4.5.tar.gz" 
boost_filesystem.patch
)
md5sums=('33ee8034b23c88be7b780621d49db167'
         '987955f274f0352c9a7cf5dfdbcc742d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 <../../boost_filesystem.patch
	autoreconf
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc 
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
#    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
