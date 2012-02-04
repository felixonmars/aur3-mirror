# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=cpige-cli
pkgver=1.5
pkgrel=2
pkgdesc="A shoutcast/icecast stream downloader"
arch=('i686')
url="http://ed.zehome.com/?page=cpige-en"
license=('GPL')
depends=('glibc')
backup=('etc/cpige.conf')
install=(${pkgname}.install)
source=(http://ed.zehome.com/cpige/cpige-${pkgver}.tar.gz)
md5sums=('ad5b8f70d254a261cfb3fda586d66448') 

build() {
  cd ${srcdir}/cpige-${pkgver}
  make 
  install -d ${pkgdir}/{etc,usr/{bin,share/{cpige,man/man1}}} 
  install -D cpige.conf.example ${pkgdir}/etc/cpige.conf
  install -m644 cpige.1.gz ${pkgdir}/usr/share/man/man1/ 
  install -m755 cpige ${pkgdir}/usr/bin/cpige

}

# vim:set ts=2 sw=2 et:
