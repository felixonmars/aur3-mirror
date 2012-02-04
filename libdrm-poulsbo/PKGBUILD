# Contributor: Chris Griffith <codelicious.griffith at gmail dot com>
pkgname=libdrm-poulsbo
pkgver=2.3.4
_ubver=1ubuntu0sarvatt4~1004um1+karmic
pkgrel=1
pkgdesc="DRM(Direct Rendering Manager) runtime library for Poulsbo"
arch=('i686')
url="https://launchpad.net/~gma500/"
license=('MIT' 'GPL2')
groups=()
depends=('glibc' 'psb-kmod>=4.41.1')
makedepends=('rpmextract')
optdepends=()
provides=('libdrm-poulsbo')
conflicts=()
replaces=()
backup=()
options=('!libtool')
install=
source=("http://ppa.launchpad.net/gma500/ppa/ubuntu/pool/main/libd/libdrm-poulsbo/${pkgname}_${pkgver}-${_ubver}.tar.gz")
noextract=()
build() {
    #cd here just in case we are not already in src.
    cd ${srcdir}/${pkgname}-${pkgver};

    #compile
    autoreconf -i;
    ./configure --prefix=/usr --libdir=/usr/lib/psb;
    make || return 1;

}
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    #install
    make DESTDIR="${pkgdir}/" install;

    #copy MIT license file
    install -dm 755 ${pkgdir}/usr/share/licenses/${pkgname}
    install -m 644 ${srcdir}/${pkgname}-${pkgver}/MIT_License.txt ${pkgdir}/usr/share/licenses/${pkgname}
  
    #remove few unwanted headers
    for i in i915 mach64 mga nouveau r128 radeon savage sis via;
    do
        rm -f ${pkgdir}/usr/include/psb/drm/${i}_drm.h;
    done
    for i in drm_serea.h r300_reg.h via_3d_reg.h
    do
	rm -f ${pkgdir}/usr/include/psb/drm/${i}
    done

    #create udev rules
    install -dm 755 ${pkgdir}/etc/udev/rules.d;
    echo "KERNEL==\"card[0-9]*\", NAME=\"dri/%k\", MODE=\"0666\"" > ${pkgdir}/etc/udev/rules.d/91-drm-modeset.rules;
    chmod 644 ${pkgdir}/etc/udev/rules.d/91-drm-modeset.rules;

    # clean up for relocation
    install -dm 755 ${pkgdir}/usr/lib/pkgconfig
    mv ${pkgdir}/usr/lib/psb/pkgconfig/libdrm.pc ${pkgdir}/usr/lib/pkgconfig/libdrm-poulsbo.pc
    install -dm 755 ${pkgdir}/etc/ld.so.conf.d
cat > ${pkgdir}/etc/ld.so.conf.d/psb.conf << EOF
/usr/lib/psb
EOF
}
md5sums=('cf3a9dbd559886b771a827bc33bc19f0')
