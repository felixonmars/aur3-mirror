# Maintainer: Dmitry Korzhevin <dkorzhevin at gmail dot com>
# Contributor: Maxime de Roucy <maxime.deroucy@gmail.com>
# Contributor: Shacristo <shacristo at gmail dot com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Stefan Husmann <stefanh-husmann@t-online.de>

pkgname=alexandria
pkgver=0.6.7
pkgrel=1
pkgdesc="A GNOME application to help you manage your book collection"
arch=('any')
url="http://alexandria.rubyforge.org"
license=('GPL2')
depends=('ruby-libglade' 'ruby-gconf2' 'ruby-gettext' 'ruby-gnome2>=0.90.5'  'hicolor-icon-theme' 'ruby-hpricot>=0.8.2' 'ruby-htmlentities>=4.2.0')
makedepends=('intltool' 'rake' 'rarian')
source=("http://files.rubyforge.vm.bytemark.co.uk/alexandria/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.patch")
md5sums=('bb399ec7568f4829ce11ca1c5c49c958'
         'edef76e94d65b5d5a51de0d2c462ef59')
install=$pkgname.install

build(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  patch -p1 < ${srcdir}/${pkgname}.patch
  
  DESTDIR="$pkgdir" rake install_package_staging

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"

  install -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/*
}
