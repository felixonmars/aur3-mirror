# Contributor: Ryan Corder <ryanc@greengrey.org>

pkgname=palm-novacom
pkgver=1.0.80
pkgrel=1
pkgdesc="Unofficial package of Novacom service for webOS development connectivity"
url="http://developer.palm.com"
arch=('i686' 'x86_64')
license=("unknown")
depends=('')

# As of 1.0.55, 64-bit has a different download
if [[ "${CARCH}" = "x86_64" ]]; then
    source=(https://cdn.downloads.palm.com/sdkdownloads/3.0.4.669/sdkBinaries/${pkgname}_${pkgver}_amd64.deb
            'novacomd'
            'novacomd-conf.d')
    md5sums=('1719e8c6705b93498fdc7110c4a73ccf'
             '56f93f60ac34f8309d6ff71e928a3481'
             '832509ecd145b9b93a291f9ad668f0e4')
else
    source=(https://cdn.downloads.palm.com/sdkdownloads/3.0.4.669/sdkBinaries/${pkgname}_${pkgver}_i386.deb
            'novacomd'
            'novacomd-conf.d')
    md5sums=('ef4414ec70ec3a08308692d152960381'
             '56f93f60ac34f8309d6ff71e928a3481'
             '832509ecd145b9b93a291f9ad668f0e4')
fi

# Extra dependencies when running 64-bit
if [[ "${CARCH}" = "x86_64" ]]; then
    depends=(${depends[@]} 'lib32-libusb')
else
    depends=(${depends[@]} 'libusb')
fi

build() {
    cd $startdir/src

    if [[ "${CARCH}" = "x86_64" ]]; then
        ar x $startdir/${pkgname}_${pkgver}_amd64.deb || return 1
    else
        ar x $startdir/${pkgname}_${pkgver}_i386.deb || return 1
    fi

    tar zxvf $startdir/src/data.tar.gz -C $startdir/pkg || return 1

    mkdir -m 0755 -p $startdir/pkg/etc/conf.d || return 1
    mkdir -m 0755 -p $startdir/pkg/etc/rc.d || return 1
    mkdir -m 0755 -p $startdir/pkg/usr/bin || return 1

    install -m 755 $startdir/novacomd $startdir/pkg/etc/rc.d/novacomd || return 1
    install -m 644 $startdir/novacomd-conf.d $startdir/pkg/etc/conf.d/novacomd || return 1

    rm -rf $startdir/pkg/opt/Palm/novacom/scripts || return 1
    rm -rf $startdir/pkg/usr/local || return 1
    rm -rf $startdir/pkg/usr/share || return 1

    ln -s /opt/Palm/novacom/novacom $startdir/pkg/usr/bin/novacom
    ln -s /opt/Palm/novacom/novaterm $startdir/pkg/usr/bin/novaterm
}
