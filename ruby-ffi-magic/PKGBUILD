# Maintainer: Michael Fellinger <mf@rubyists.com>
pkgname=ruby-ffi-magic
_pkgname=ffi-magic
pkgver=2011.04.22
pkgrel=1
pkgdesc="Ruby FFI binding for libmagic"
arch=(any)
url="http://github.com/manveru/$_pkgname"
license=(MIT)
depends=(ruby ruby-ffi)
source=("http://rubygems.org/gems/$_pkgname-$pkgver.gem")
noextract=("$_pkgname-$pkgver.gem")
md5sums=(0ad6175c6c777a629cedca0409c01ed5)

build() {
 cd $srcdir
 local _gemdir="${pkgdir}`ruby -e 'puts Gem.default_dir'`"

 gem install --ignore-dependencies -i $_gemdir "${_pkgname}-${pkgver}.gem"
 rmdir $pkgdir/usr/lib/ruby/gems/1.9.1/doc
 local _license="$_gemdir/gems/${_pkgname}-${pkgver}/LICENSE"
 install -Dm644 $_license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
