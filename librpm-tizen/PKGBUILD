# Maintainer: Junchun Guan <junchunx.guan@gmail.com>
pkgname=librpm-tizen
pkgver=4.11.0.1.tizen20130618
pkgrel=1
pkgdesc="The RPM libraries for git-buildpackage"
arch=('i686' 'x86_64')
url=("http://www.rpm.org/")
license=('GPL2')
depends=('lua' 'file' 'nss>=3.12' 'popt' 'elfutils' 'libarchive')
makedepends=('python2' 'gettext')
options=('!libtool')
provides=("rpm-tizen=${pkgver}-20140611")
source=(http://download.tizen.org/tools/archive/14.03.1/openSUSE_13.1/src/librpm-tizen-4.11.0.1.tizen20130618-16.1.src.rpm)
sha256sums=('c7d3da5fea33287cf46d6856357a28e33681d2fb5b1976723674c7018022e54c')
CPPFLAGS="$CPPFLAGS `pkg-config --cflags nss`"
_python_mod_name=rpm_tizen

prepare() {
        cd "$srcdir"
        tar -x -f rpm-$pkgver.tar.gz
        cd "$srcdir/rpm-${pkgver}"
        for patch_file in $(find ../ -maxdepth 1 -name '*.patch' |sort)
        do
            patch -p1 -i $patch_file
        done
}

build() {
        cd ${srcdir}/rpm-${pkgver}

        autoreconf -i -f
        ./configure \
                --prefix=/usr \
                --libdir=/usr/lib/${pkgname} \
                --disable-dependency-tracking \
                --with-lua \
                --without-acl \
                --without-cap \
                --enable-shared \
                --enable-python \
                --without-msm \
                --with-external-db \
                PYTHON=python2 \
                PYTHON_MODULENAME=${_python_mod_name}

        make
}

package() {
        cd ${srcdir}/rpm-${pkgver}
        make install DESTDIR="${pkgdir}"

        # Install extra sources
        install -m644 ${srcdir}/rpm-tizen_macros ${pkgdir}/usr/lib/${pkgname}/rpm/tizen_macros
        install -d ${pkgdir}/usr/lib/${pkgname}/rpm/tizen
        ln -s ../tizen_macros ${pkgdir}/usr/lib/${pkgname}/rpm/tizen/macros

        # Delete unwanted development files etc.
        find ${pkgdir} -name "*.la" | xargs rm -f --
        find ${pkgdir}/usr/lib/${pkgname} -name "*.so" | xargs rm -f --
        rm -rf "${pkgdir}/usr/lib/${pkgname}/pkgconfig"
        rm -rf "${pkgdir}/usr/lib/${pkgname}/rpm-plugins"
        rm -rf "${pkgdir}/bin"
        find "$pkgdir/usr" -mindepth 1 -maxdepth 1 -type d  ! -name lib | xargs rm -rf

}
