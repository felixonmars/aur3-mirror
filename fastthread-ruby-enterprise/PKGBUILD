# Contributor: oleg dashevskii <olegdashevskii@gmail.com>

_pkg=fastthread
pkgname=fastthread-ruby-enterprise
pkgver=1.0.7
pkgrel=1
pkgdesc="This is the fastthread module for Ruby Enterprise Edition."
arch=('i686' 'x86_64')
license=('GPL')
url="http://rubyforge.org/projects/mongrel"
depends=('ruby-enterprise')
source=(http://rubyforge.org/frs/download.php/54691/$_pkg-$pkgver.tgz extconf.patch)
md5sums=('d24d223742c5bd2eaeb1d33fc50983aa'
         'd64791466127cbd355aff5c9f73a2219')

build() {
    cd $startdir/src/$_pkg-$pkgver
    patch ext/fastthread/extconf.rb < $startdir/extconf.patch
    ruby=/opt/ruby-enterprise/bin/ruby

    $ruby setup.rb config
    $ruby setup.rb setup
    $ruby setup.rb install --prefix=$pkgdir
}
