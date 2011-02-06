# Maintainer: sandrick <sandrick[at]seznam[dot]cz>

pkgname=hunspell-cz
pkgver=20061030
pkgrel=2
pkgdesc="Czech hunspell/myspell dictionary"
arch=('any')
url="http://ftp.sh.cvut.cz/MIRRORS/OpenOffice/contrib/dictionaries/"
license=('GPL2' 'custom')
depends=('hunspell')
source=(${url}cs_CZ-pack.zip)
md5sums=('a778a2a0df6abf505fd8b20a503414e0')

build()
{
    /bin/true
}

package() 
{
    cd ${srcdir}
    bsdtar -xf cs_CZ.zip
    install -D -m 644 cs_CZ.aff ${pkgdir}/usr/share/myspell/dicts/cs_CZ.aff
    install -D -m 644 cs_CZ.dic ${pkgdir}/usr/share/myspell/dicts/cs_CZ.dic

    # simlinks are needed    
    install -dm755 ${pkgdir}/usr/share/hunspell
    for file in ${pkgdir}/usr/share/myspell/dicts/*; do
        ln -s /usr/share/myspell/dicts/$(basename $file) ${pkgdir}/usr/share/hunspell/$(basename $file)
    done
}
