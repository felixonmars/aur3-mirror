pkgname=sct3511
pkgver=5.0.21
arch=('x86_64')
pkgdesc="Drivers for Smart Card Readers (e.g. SCR3XXX)"
pkgrel=3
url="http://www.scm-pc-card.de"
depends=('libusb-compat' 'pcsclite')
license=('custom')
source=("http://www.scm-pc-card.de/file/driver/Readers_Writers/sct3511_-_linux_64-bit_driver.gz")
md5sums=("bfb41025bb9cca96770f163d2fd5120f")

build() {
    cd $srcdir
    tar -xzf sct3511_-_linux_64-bit_driver.gz
    cd "scmccid_${pkgver}_linux"
    install -D "proprietary/LICENSE" "$srcdir/usr/share/licenses/$pkgname/LICENSE"
    bundle_path=$(pkg-config libpcsclite --variable=usbdropdir)
    install -D -m664 "scmccid.ini" "$srcdir/usr/local/scm/ini/scmccid.ini"
    install -d "${srcdir}${bundle_path}"
    cp -a "proprietary/scmccid.bundle" "${srcdir}${bundle_path}"
    install -d "$srcdir/usr/local/lib/pcsc/drivers"
    ln -rfs "${srcdir}${bundle_path}/scmccid.bundle" "${srcdir}/usr/local/lib/pcsc/drivers"
    cd $srcdir
    mv "$srcdir/usr" "$pkgdir/usr"
}

