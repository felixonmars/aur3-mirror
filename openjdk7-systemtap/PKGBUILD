# Maintainer: Eduardo Diaz <eduardo[at]just-cloud[dot]com>]
pkgname=openjdk7-systemtap
pkgver=1.7.0_02_b13
pkgrel=1
pkgdesc="OpenJDK 7 with systemtap support"
url="http://iamedu.wordpress.com"
arch=('x86_64' 'i686')
license=('custom')
provides=('java-runtime=7' 'java-environment=7')
replaces=('openjdk7')
conflicts=('java-runtime' 'openjdk7')
depends=('systemtap')
makedepends=('openjdk6' 'libxp' 'libxslt' 'systemtap'
             'alsa-lib' 'apache-ant>=1.8.1' 'giflib' 'libpng>=1.4.8' 'gtk2'
             'rhino' 'libpulse>=0.9.11' 'zip' 'unzip' 'cpio' 'fastjar')
source=("http://icedtea.classpath.org/download/source/icedtea-2.0.tar.gz"
        fontconfig-paths.diff
        fix_corba_cmds_path.diff
        openjdk7_fix_jdk_cmds_path.diff
        openjdk7_nonreparenting-wm.diff
        glibc2_15.diff)
md5sums=('752721a037a625001fad7a5fc2013f60'
         'ee1afda124d5927345014ab382ef581e'
         'f7e7a212e50abb56a6ef1a2b1bd27405'
         'c195c4865b84d9e2e0fd71ac6d88eadb'
         '203640d6e79e41b0065e016818c17ccd'
         'a4293acadff03bdccbc9b412ad288549')

options=(!strip docs libtool emptydirs zipman ccache)

_jvmdir=/usr/lib/jvm/java-7-openjdk

build() {
    cd "${srcdir}/icedtea-2.0"
    unset JAVA_HOME JDK_HOME CLASSPATH JAVAC JAVACFLAGS MAKEFLAGS

    cp ${srcdir}/*.diff ${srcdir}/icedtea-2.0/patches
    export DISTRIBUTION_PATCHES="patches/fontconfig-paths.diff patches/fix_corba_cmds_path.diff patches/openjdk7_fix_jdk_cmds_path.diff patches/openjdk7_nonreparenting-wm.diff patches/glibc2_15.diff"

    ./configure \
        --with-parallel-jobs="${MAKEFLAGS/-j}" \
        --with-pkgversion="ArchLinux + Systemtap build ${pkgver}-${pkgrel}-${CARCH}" \
        --with-jdk-home=${JAVA_HOME} \
        --enable-pulse-java \
        --enable-nss \
        --enable-systemtap \
        --with-abs-install-dir=${_jvmdir} \
        --disable-tests \
        --disable-bootstrap \
        --with-rhino
    make
}

package() {
    cd "${srcdir}/icedtea-2.0/openjdk.build/j2sdk-image"
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

