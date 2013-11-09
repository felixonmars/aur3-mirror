#Contributor: Jesse Jaara <jesse.jaara@gmail.com>
#Maintainer: Allen Choong <allencch at hotmail.com>

pkgname=jmf
pkgver=2.1.1e
pkgrel=9
pkgdesc="Java Media Framework with (mp3 plugin)"
url="http://java.sun.com/products/java-media/jmf/"
license="custom"
arch=('i686' 'x86_64')
depends=('java-environment')
makedepends=('unzip' 'curl')

_url() {
	if [ ! -e "jmf-${pkgver//./_}-alljava.zip" ] ; then
		output=`curl -b 's_cc=true; s_nr=1383869208365; gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavasebusiness%2Fdownloads%2Fjava-archive-downloads-java-client-419417.html%237372-jmf-2.1.1e-oth-JPR; s_sq=%5B%5BB%5D%5D' -o - "https://edelivery.oracle.com/otn-pub/java/jmf/2.1.1e/jmf-2_1_1e-alljava.zip" | grep -o '"[^"]*"' |sed s/\"//g` 
		echo $output #eg: http://download.oracle.com/otn-pub/java/jmf/2.1.1e/jmf-2_1_1e-alljava.zip?AuthParam=1383871754_4a6d6dc40f98e083a64b065367d7093e
	fi
}
source=("jmf-${pkgver//./_}-alljava.zip::"`_url`
	"http://huulivoide.pp.fi/Arch/jmf-mp3.tar.xz"
	LICENSE)
md5sums=('5dafc2469b22d18420ada45972a88ec0'
         '19e483a0c53396656c3885646a9d60b2'
         '96afb7ef8418bcdccfaae615de40881a')
install="jmf.install"

JAVA_HOME=$(readlink -f $(which java)|sed "s:/jre/bin/java::")

package() {
    cd "${srcdir}"

    mkdir "${pkgdir}$JAVA_HOME/jre/lib/ext" -p
	
    cd JMF-2.1.1e/
    cp bin "${pkgdir}$JAVA_HOME/jre/" -r
    cp lib/*.jar "${pkgdir}$JAVA_HOME/jre/lib/ext/"
    cp lib/jmf.properties "${pkgdir}$JAVA_HOME/jre/lib/"
    
    cp "${srcdir}/jmfRegisterMp3Plugin" "${pkgdir}$JAVA_HOME/jre/bin/"
    cp "${srcdir}/registerMp3Plugin.class" "${pkgdir}$JAVA_HOME/jre/lib/"
    cp "${srcdir}/mp3plugin.jar" "${pkgdir}$JAVA_HOME/jre/lib/ext/"

    #Copy license
    mkdir -p  "${pkgdir}/usr/share/licenses/${pkgname}/"
    cp "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}


