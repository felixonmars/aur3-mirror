# Contributor: Alexander Kuzmenkov <rc.4096@gmail.com>
# Maintainer: Henning Bekel <h.bekel@googlemail.com>

pkgname=ruby-taglib
pkgver=1.1
pkgrel=2
pkgdesc="Ruby bindings for taglib"
arch=('any')
url="http://www.hakubi.us/ruby-taglib/"
license=('MIT')
depends=('ruby' 'taglib')
source=(
  "http://www.hakubi.us/wp-content/uploads/software/${pkgname}-${pkgver}.tar.bz2" 
  "ruby-1.9.patch" 
  "ruby-taglib.license"
)
md5sums=('462d2717c912251b6d9693e0ac40c08f' '232a87607113887d25e5ea89df1bfe67'\
         'fde6fbe9cefcc500acf71fa08c27bf26')

build() {
  return 0;
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i ../ruby-1.9.patch

  ruby setup.rb config
  ruby setup.rb setup
  ruby setup.rb install --prefix="${pkgdir}"

  install -D -m 644 "${srcdir}/ruby-taglib.license" \
    "${pkgdir}/usr/share/licenses/ruby-taglib/COPYING"
}
