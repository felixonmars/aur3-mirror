# Maintainer: snyh <snyh@snyh.org>
pkgname=ruby-smestorage
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="The SMEStorage Ruby API" 
arch=('i686')
url="http://code.google.com/p/smestorage/"
license=('custom')
groups=()
depends=()
makedepends=('ruby')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://smestorage.googlecode.com/files/SMEStorage%20gem.zip")
noextract=()
md5sums=("d9a47e7687e2a79fbc65be80ac36b786")


package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" sme_storage-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}
