# Maintainer: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Markku <rasat@user-contributions.org>

pkgname=mysql-ruby-enterprise
pkgver=2.8.1
pkgrel=1
pkgdesc="This is the MySQL API module for Ruby Enterprise Edition."
arch=('i686' 'x86_64')
license=('GPL')
url="http://tmtm.org/downloads/mysql/ruby"
depends=('ruby-enterprise' 'libmysqlclient')
source=(http://tmtm.org/downloads/mysql/ruby/mysql-ruby-$pkgver.tar.gz)
md5sums=('83b068619f6e9cfb5778125673462f09')

build() {
    cd $startdir/src/mysql-ruby-$pkgver
    /opt/ruby-enterprise/bin/ruby extconf.rb
    /opt/ruby-enterprise/bin/ruby extconf.rb --with-mysql-config
    make || return 1
    make DESTDIR=$pkgdir install
}
