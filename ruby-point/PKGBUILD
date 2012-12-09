# Maintainer: Tom Vincent <http://tlvince.com/contact>

_pkgname=point
pkgname=ruby-$_pkgname
pkgver=1.0.1
pkgrel=1
pkgdesc="Ruby Point DNS API Client"
arch=('any')
url='https://github.com/atech/point'
license='MIT'
depends=('ruby')
source=("http://gems.rubyforge.org/gems/$_pkgname-${pkgver}.gem")

build() {
  cd "$srcdir"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}/$(gem environment gemdir)" "$_pkgname-${pkgver}.gem"
}

md5sums=('aeaf740717299e0909e9037eb1c1e52d')
