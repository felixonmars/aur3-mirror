# Bloom: facebook uploader / downloader
# Author: Carl Antaki 
# Maintainer: Marek Otahal <markotahal gmail>

pkgname=bloom-facebook
pkgver=2.9.1
pkgrel=4
pkgdesc="Bloom : facebook uploader & downloader, manage/create/store/upload your albums, photos and videos"
arch=(any)
url="http://antaki.ca/bloom/"
license=('unknown')
depends=('java-runtime' 'java-web-start')
changelog='Changelog.txt'
install='bloom-facebook.install'
source=('http://antaki.ca/bloom/Bloom.jnlp'
        'bloom-facebook')

md5sums=('11d3c91ec4240e290271a0355cae9bad'
         '54f3b877c679b329656162658967ecde')

build() {
msg "installing Bloom"   
}

package() {
cd $pkgdir
install -m755 -d ${pkgdir}/usr/bin
install -m755 ${srcdir}/bloom-facebook ${pkddir}usr/bin
install -m644 ${srcdir}/Bloom.jnlp ${pkddir}usr/bin

msg "done"
}

# vim:set ts=2 sw=2 et:
