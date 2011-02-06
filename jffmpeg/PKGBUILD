#Contributor: Dario Andres Rodriguez <andresbajotierra@gmail.com>

pkgname=jffmpeg
pkgver=1.1.0
pkgrel=2
pkgdesc="Codec Pack for the Java Media Framework based around a Java port of parts of the FFMPEG project"
url="http://jffmpeg.sourceforge.net/"
license=('gpl' 'lgpl' 'bsd')
arch=(i686)
depends=('jmf' 'ffmpeg')
source=(http://downloads.sourceforge.net/jffmpeg/jffmpeg-$pkgver.jar http://downloads.sourceforge.net/jffmpeg/libjffmpeg-$pkgver.so jmfRegisterJffmpegPlugin registerJffmpeg.class jmfUnregisterJffmpegPlugin unregisterJffmpeg.class)
install="jffmpeg.install"

build() {
	cd $startdir/src
	
    mkdir $startdir/pkg/opt/java/jre/{lib/ext,bin} -p
	
    cp $startdir/src/jffmpeg-$pkgver.jar $startdir/pkg/opt/java/jre/lib/ext/
    cp $startdir/src/libjffmpeg-$pkgver.so $startdir/pkg/opt/java/jre/lib/ext/
    cp $startdir/src/jmfRegisterJffmpegPlugin $startdir/pkg/opt/java/jre/bin/
    cp $startdir/src/registerJffmpeg.class $startdir/pkg/opt/java/jre/lib/
    cp $startdir/src/jmfUnregisterJffmpegPlugin $startdir/pkg/opt/java/jre/bin/
    cp $startdir/src/unregisterJffmpeg.class $startdir/pkg/opt/java/jre/lib/
}
md5sums=('957971c17768c7238a4fe1046d8dc332'
         'f61ae4ef26b3325df8655eba328d17a1'
         '0f49bd0329ac3f06b9dc202ca75f9661'
         '70430513495980037509660789aed9d0'
         '7c58cf3b92e94f6d17b598701a5c2ead'
         '5678737e53ad9f301272462521c84528')
