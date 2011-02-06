pkgname=gwclient32
pkgver=8.0.2
pkgrel=1
pkgdesc="Novell Groupwise 8 Client for Linux (i686 Arch)"
url="http://gwclient.provo.novell.com/"
arch=('i686')
depends=('glibc' 'libstdc++5' 'gcc' 'unzip' 'jre')
srcname="GW802LinuxClient.zip"
source=(http://gwclient.provo.novell.com/client/$srcname)
license="Novell-GW-8"

build()
{
    cd $startdir/src
    unzip -o $srcname "*client*"
    cd $startdir/pkg
    rpmextract.sh $startdir/src/novell-groupwise-client-8.0.2-90840.i586.rpm
    chmod +rx opt usr usr/share
    rm -rf opt/novell/groupwise/client/jre
    sed -i 's%opt/novell/groupwise/client/jre%${JAVA_HOME}/jre%' "$startdir"/pkg/opt/novell/groupwise/client/bin/groupwise
    sed -i '/LD_LIBRARY_PATH/s/:.*/:\/opt\/java\/jre\/lib\/i386:\/opt\/java\/jre\/lib\/i386\/client/' $startdir/pkg/opt/novell/groupwise/client/bin/groupwise
}
md5sums=('520165448d2cb741fab1aadf9c52e5e0')
