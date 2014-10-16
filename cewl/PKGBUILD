# Contributor: Mauro Andreolini <mauro.andreolini@unimore.it>
# Maintainer: Pierre-Antoine Rault <par at rigelk dot eu>

pkgname=cewl
pkgver=5.1
pkgrel=1
epoch=
pkgdesc="A custom word list generator, gathered by spidering websites or files (with the fab utility)."
arch=('any')
url="http://www.digininja.org/projects/cewl.php"
license=('GPL3')
depends=(ruby ruby-spider ruby-mini_exiftool ruby-nokogiri ruby-http_configuration ruby-rubyzip ruby-mime-types)
install=
changelog=
source=("http://www.digininja.org/files/cewl_5.1.tar.bz2"
	"cewl.patch"
	"fab.patch")
md5sums=('ff40c1a4eb67c4169c5ec80e1489bee4'
         'aea26d6d0d885cb21d49c5a26d4cd3ed'
         '359fcf361f0db80b7006f004dd346d88')
build() {
  cd ${srcdir}/${pkgname}
  patch -Np1 -i ../cewl.patch
  patch -Np1 -i ../fab.patch
}

package() {
  install -D -m755 ${srcdir}/${pkgname}/cewl.rb ${pkgdir}/usr/bin/cewl
  install -D -m755 ${srcdir}/${pkgname}/fab.rb ${pkgdir}/usr/bin/fab
  install -d -m755 ${pkgdir}/usr/share/${pkgname}
  install -D -m644 ${srcdir}/${pkgname}/README ${pkgdir}/usr/share/${pkgname}/README
  install -d -m755 ${pkgdir}/usr/lib/ruby/vendor_ruby/${pkgname}
  install -D -m644 ${srcdir}/${pkgname}/cewl_lib.rb ${pkgdir}/usr/lib/ruby/vendor_ruby/${pkgname}/cewl_lib.rb
}
