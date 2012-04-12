# Co-maintainer: Gitus < git at shroomrider dot com >
# Co-maintainer: Enjolras < 0enjolras0 at laposte dot net >

pkgname=seeks
pkgver=0.4.1
pkgrel=1
pkgdesc="An open decentralized platform for collaborative search content"
arch=('i686' 'x86_64')
url="http://www.seeks-project.info"
license=('custom:"AGPL3"')
backup=('etc/logrotate.d/seeks'
    'etc/conf.d/seeks'
    'etc/seeks/config')
depends=('curl' 'libevent'  'protobuf' 'tokyotyrant' 'opencv' 'icu')
makedepends=('docbook2x' 'pkg-config' )
conflicts=('seeks-git')
source=("http://www.seeks-project.info/site/releases/$pkgname-$pkgver.tar.gz"
    'seeks'
    'seeks.conf.d'
    'seeks.logrotate'
    'logfile.patch'
)
install='install'
sha256sums=('b890f2e95ab0161e0be6f82cfc224f9cf6e49ce69d18bf3decddb91fb85cebde'
            '5933968805bdaea64b075cfbe6915fbca41e39788edf8dbdb742b8aea4fbf910'
            'c78945d6ec3917aba0f860bebb4cc83af87ae04c5641ee6c605bd6fbc77cc384'
            'f2bd002e666c6a7cc9429f9c54da55e31e03aafab7f666c53c8a5fd6747653bf'
            '3d6bbd12c1911520f6fd42e5e3c43cd5b4d40be17d997bf0ba42d3c8f2a0450a')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    autoreconf -ivs
    sed -i s/docbook2x-man/docbook2man/ ./configure
    ./configure LDFLAGS="-Wl,--no-as-needed" \
	--prefix=/usr --sysconfdir=/etc \
	--enable-opencv --enable-httpserv-plugin --enable-image-websearch-plugin=yes \
	--enable-xslserializer-plugin --enable-personalization --enable-keepalive --enable-extended-host-patterns
    
    sed -i s/cxflann.h/cv.h/ src/plugins/img_websearch/ocvsurf.cpp
    sed -i s/,--as-needed,/,/ config.status
    
    make
    
}

package() {
    cd  "$srcdir/$pkgname-$pkgver/src/"

    #Changing logdir and logfile options
    #disable plugins cf and query-capture in config
    patch -p0 < "$srcdir/logfile.patch"
    
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install
   
    install -D -m644 Licenses  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -m644 AGPL-3.txt  "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 BSD-yui.txt  "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -D -m755 ../seeks  "${pkgdir}"/etc/rc.d/seeks
    install -D -m644 ../seeks.conf.d "${pkgdir}"/etc/conf.d/seeks
    install -D -m600 ../seeks.logrotate  "${pkgdir}"/etc/logrotate.d/seeks
}
