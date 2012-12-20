# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

_basename_=vlc
_extname_=wikipedia
pkgname=${_basename_}-${_extname_}
pkgver=0.1
pkgrel=1
pkgdesc="The VLC Wikipedia Lookup extension"
arch=("any")
url="http://addons.videolan.org/content/show.php/wikipedia+information?content=140700"
license=("GPL")
depends=("${_basename_}")
options=(!emptydirs)
source=(http://addons.videolan.org/CONTENT/content-files/140700-${_extname_}extension.lua)

package() {
	cd "${srcdir}"
	
	install -D 140700-${_extname_}extension.lua ${pkgdir}/usr/lib/${_basename_}/lua/extensions/${_extname_}extension.lua
}

sha1sums=('d6d503bd7175fb540271c737ebc6d7f0b0e0a4e0')
