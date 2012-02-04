# Contributor: Juan Diego Tascon

pkgname=ruby-rubygsm
pkgver=0.41
pkgrel=1
pkgdesc="Ruby interface to AT-compatible GSM modems"
arch=('i686' 'x86_64')
url='https://github.com/adammck/rubygsm'
license='GPL2'
depends=('ruby-serialport')
source=("http://gems.github.com/gems/adammck-rubygsm-${pkgver}.gem")

build() {
  cd "$srcdir"
  gem install --ignore-dependencies \
    -i "${pkgdir}/$(gem environment gemdir)" "adammck-rubygsm-${pkgver}.gem"
}

md5sums=('3310557059dcda3995a208ebdc7426ff')
