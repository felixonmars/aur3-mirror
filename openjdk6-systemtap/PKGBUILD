# Maintainer: Eduardo Diaz <eduardo[at]just-cloud[dot]com>]
pkgname=openjdk6-systemtap
pkgver=1.6.0_b24
pkgrel=1
pkgdesc="OpenJDK 7 with systemtap support"
url="http://iamedu.wordpress.com"
arch=('x86_64' 'i686')
license=('custom')
provides=('java-runtime=6' 'java-environment=6')
replaces=('openjdk6')
conflicts=('java-runtime' 'openjdk6')
depends=('systemtap')
makedepends=('openjdk6' 'libxp' 'libxslt' 'systemtap'
             'alsa-lib' 'apache-ant>=1.8.1' 'giflib' 'libpng>=1.4.8' 'gtk2'
             'rhino' 'libpulse>=0.9.11' 'zip' 'unzip' 'cpio' 'fastjar')
source=("http://icedtea.classpath.org/download/source/icedtea6-1.11.tar.gz")
md5sums=('10c1cea1d24c064572abfe9687567948')
options=(!strip docs libtool emptydirs zipman ccache)
install='openjdk6.install'

_jvmdir=/usr/lib/jvm/java-6-openjdk

build() {
    cd "${srcdir}/icedtea6-1.11"
    unset JAVA_HOME JDK_HOME CLASSPATH JAVAC JAVACFLAGS

    ./configure \
        --with-parallel-jobs="${MAKEFLAGS/-j}" \
        --with-pkgversion="ArchLinux + Systemtap build ${pkgver}-${pkgrel}-${CARCH}" \
        --with-jdk-home=${JAVA_HOME} \
        --enable-pulse-java \
        --enable-nss \
        --enable-systemtap \
        --with-abs-install-dir=${_jvmdir} \
        --disable-bootstrap \
        --disable-tests \
        --with-rhino
    make
}

package() {
    cd "${srcdir}/icedtea6-1.11/openjdk.build/j2sdk-image"
    install -m755 -d ${pkgdir}/${_jvmdir}/
    install -m755 -d ${pkgdir}/usr/local/share/systemtap/tapset

    cp -a tapset/* ${pkgdir}/usr/local/share/systemtap/tapset

    cp -ar * ${pkgdir}/${_jvmdir}/
    rm -rf ${pkgdir}/${_jvmdir}/tapset
   
    pushd ../j2re-image/man
    install -m755 -d ${pkgdir}/usr/share/man/man1/
    install -m644 man1/*.1 ${pkgdir}/usr/share/man/man1
    popd

    # Link binaries into /usr/bin
    pushd ${pkgdir}/${_jvmdir}/bin
    install -m755 -d ${pkgdir}/usr/bin/
    for file in *; do
      ln -sf ${_jvmdir}/jre/bin/${file} ${pkgdir}/usr/bin
    done
    popd

    # Link JKS keystore from ca-certificates-java
    rm -f ${pkgdir}/${_jvmdir}/jre/lib/security/cacerts
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/jre/lib/security/cacerts"

    # Install license
    install -m755 -d ${pkgdir}/usr/share/licenses/${pkgbase}/
    install -m644 ASSEMBLY_EXCEPTION LICENSE THIRD_PARTY_README \
                 ${pkgdir}/usr/share/licenses/${pkgbase}

}

