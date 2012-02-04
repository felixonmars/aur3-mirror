pkgname=secretsync
pkgver=0.209b
pkgrel=1
pkgdesc="Turn Dropbox into a private, encrypted pipeline for your files."
arch=('any')
url="http://getsecretsync.com/ss/"
license=('custom:')
depends=('java-runtime')

sha1sums=('912f880f8824314305b88a137dab4018cf5c8a6f')
source=("http://www.completelyprivatefiles.com/ss/secretsync.deb")


package() {
    msg "Extracting the package"
    ar -xv secretsync.deb
    tar -xvf data.tar.gz

    msg "Preparing for installation"
    cp -r "$srcdir"/usr "$pkgdir"/usr
    msg2 "Installation finished!"
}
