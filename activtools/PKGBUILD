# Maintainer: Bazon <bazonbloch@arcor.de>
pkgname=activtools
pkgver=5.8.46
pkgrel=1
pkgdesc="Tools to calibrate (activcalibrate) and manage (activmgr) Promethean hardware devices."
arch=('i686' 'x86_64')
url="http://activsoftware.co.uk/linux/repos/ubuntu/dists/precise/Release"
license=('unknown')
depends=('qt4' 'activdriver')
if [ "$CARCH" = "i686" ]; then
  _arch='i386'
  _md5sum='f6ae0e4f76b9d3f90cf1557cbc9ff3df'
elif [ "$CARCH" = "x86_64" ]; then
  _arch='amd64'
  _md5sum='731540a2034a925c6e01adc7c1c36eb3'
fi
optdepends=('activinspire: activboard presentation')
install=$pkgname.install
source=(http://activsoftware.co.uk/linux/repos/ubuntu/pool/non-oss/a/activtools/activtools_$pkgver-13~ubuntu~1204_$_arch.deb)
md5sums=( $_md5sum )

package() {
        # extract the archive
        bsdtar -xf data.tar.gz -C "$pkgdir"

        # move out of the local directory to match arch standards
        mv "$pkgdir"/usr/local/* "$pkgdir"/usr/
        rmdir "$pkgdir"/usr/local

        #activmgr works only when started after board is attached, so no autostart. 
        #Delete the follwing line if you want an autostart of activmgr
	rm -r "$pkgdir"/etc

        #activcalibrate needs libactivboardex.so.1 instead of libactivboardex.so.1.0 
        #(and needs to be killed after last calibration point with Alt+F4)
        #(if you know how to fix: please tell!)
	ln -s "$pkgdir"/usr/lib/libactivboardex.so.1.0 "$pkgdir"/usr/lib/libactivboardex.so.1 
        if [ "$CARCH" = "x86_64" ]; then   
            ln -s "$pkgdir"/usr/lib32/libactivboardex.so.1.0 "$pkgdir"/usr/lib32/libactivboardex.so.1 
        fi

        # when activtools is installed, activinspire needs to be killed before it can restart
        #(if you know how to fix: please tell!)
        # therefore, a second launcher to restart activinspire is created (inspire-restart)
        echo "#! /bin/bash" > "$pkgdir"/usr/bin/inspire-restart
        echo "killall inspire Inspire ; inspire" >> "$pkgdir"/usr/bin/inspire-restart
        chmod 755 "$pkgdir"/usr/bin/inspire-restart
        install -Dm644 ../activinspire-restart.desktop "$pkgdir"/usr/share/applications/activinspire-restart.desktop
}
