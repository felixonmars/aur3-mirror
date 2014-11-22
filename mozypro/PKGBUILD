#Maintainer: Jeff Casavant <jeff.casavant@gmail.com>

pkgname=mozypro
pkgver=1.0.6
pkgrel=2
arch=('i686' 'x86_64')
license=('custom')

pkgdesc="The client for the Mozy online backup service."

depends=(deb2targz)

url="http://mozy.com/product/download/backup/mozypro"

if test "$CARCH" == x86_64
then
    source=("https://client.mozy.com/downloads/mozypro-deb-64setup.deb")
    md5sums=("7d462cace777184d163f05ac1c7dc383")
else
    source=("https://client.mozy.com/downloads/mozypro-deb-32setup.deb")
    md5sums=("d3077fa4d67bfa2287a7ba6e5ce1e5bd")
fi

package() {
    cd "${srcdir}"
    deb2targz ./mozypro-deb-*setup.deb
    tar xvzf ./mozypro-deb-*setup.tar.gz -C $pkgdir
    mkdir -p $pkgdir/usr/share/licenses/mozypro
    gunzip $pkgdir/usr/share/doc/mozybackup/EULA.gz > $pkgdir/usr/share/licenses/mozypro/LICENSE
}
