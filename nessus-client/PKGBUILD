# Contributer: Pranay Kanwar <pranay.kanwar@gmail.com>

pkgname=nessus-client
pkgver=4.0.2
pkgrel=1
pkgdesc="Nessus client for nessus security scanner."
depends=('glib' 'glib2' 'openssl' 'libpng' 'fontconfig' 'xorg-server')
makedepends=('rpmextract')
url="http://www.nessus.org"
license='custom'
arch=(i686 x86_64)

source=(NessusClient-$pkgver-fc11.i586.rpm
        nessusclient.install
	    LICENSE)

md5sums=('03a636493f2942747d617f73cb89b92f'
         '14329de05281b36d4974fe5c93990164'
         '64f80876ba31ebfd74d87e8c043996cb')

[ "$CARCH" = "x86_64" ] && source[0]=NessusClient-$pkgver-fc11.x86_64.rpm
[ "$CARCH" = "x86_64" ] && md5sums[0]='bad5d0a23decf11fa5477bc981694fb2'

build() {
    cd $startdir/src

    echo -n "==> Extracting files from the rpm..."
    if [ "$CARCH" = "i686" ]; then
         rpmextract.sh NessusClient-$pkgver-fc11.i586.rpm &> /dev/null
    else
         rpmextract.sh NessusClient-$pkgver-fc11.$CARCH.rpm &> /dev/null
    fi
    echo done.
                 
    echo -n "==> Patching files..." 
    patch_files=(opt/nessus/bin/NessusClient)
    
    for elem in $(seq 0 $((${#patch_files[@]}-1)))
    do 
        sed -i 's/libcrypto.so.8/libcrypto.so\x00\x00/' "${patch_files[$elem]}"
        sed -i 's/libssl.so.8/libssl.so\x00\x00/' "${patch_files[$elem]}"
    done
    echo "done."

    mv opt $startdir/pkg
    mv usr $startdir/pkg
    mkdir -p $startdir/pkg/usr/share/licenses/nessus-client
    cp $startdir/src/LICENSE $startdir/pkg/usr/share/licenses/nessus-client
}
