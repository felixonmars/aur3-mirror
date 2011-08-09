# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Christian <christian@whirry.org>

pkgname='glark'
pkgver=1.9.0
pkgrel=1
pkgdesc='Grep-like search utility for text files, with complex regular expressions.'
url='http://www.incava.org/projects/glark/'
arch=('any')
license=('none')
depends=('ruby')
source=("http://www.incava.org/files/${pkgname}-${pkgver}.gem")
md5sums=('792f896b426b908c4b765b453f5ae64e')

build()
{
	cd "$srcdir"

	_gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --verbose -i "$pkgdir$_gemdir" -n "$pkgdir"/usr/bin $pkgname-$pkgver.gem
}
