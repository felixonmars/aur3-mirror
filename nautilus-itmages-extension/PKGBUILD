# Contributor: Voldemar Khramtsov <harestomper@gmail.com>

pkgname=nautilus-itmages-extension
pkgver=1.18
pkgrel=1
pkgdesc="Scripts for uploading pictures to ITmages.ru"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~itmages/itmages/itmages-nautilus-extension"
license=('GPL')
groups=('graphics')
depends=('nautilus' 'python2' 'python-pycurl' 'pygtk')
_origname='itmages-nautilus-extension'
#provides=()
#conflicts=()
#replaces=()
install='nautilus-extension.install'
source=(
#    "https://api.opensuse.org/public/source/home:itmages/${_origname}/${_origname}-${pkgver}.tar.gz"
    "${_origname}/${_origname}-${pkgver}.tar.gz"
    'nautilus-extension.install'
    )

md5sums=('addf858f5e5ad320a1d2dd55b5ceb21b'
         '11e1645b237257345635712431f97ad6')


build() {
    
    cd "${srcdir}/${_origname}-${pkgver}"
    /bin/bash ./setver.sh "${pkgver}" --make
    python2 ./setup.py install --c-ext \
                               --archlib=lib \
                               --compile \
                               --optimize=2 \
                               --prefix="${pkgdir}/usr"
    
}

# vim:set ts=2 sw=2 et:

