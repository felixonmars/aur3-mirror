# Contributor: Jan Rueegg <rggjan at gmail dot com>
pkgname=smarbs
pkgver=0.9.2
pkgrel=1
pkgdesc="A small, yet fast and highly automated backup script written in Ruby"
arch=('i686' 'x86_64')
url="http://smarbs.sourceforge.net"
license=('GPL')
depends=('rsync' 'ruby' 'coreutils')
optdepends=("ruby-gtk2: For status icon while backupping"
            "syslog-ng: For syslog functionality")

source=(http://downloads.sourceforge.net/sourceforge/smarbs/${pkgname}-${pkgver}.tar.gz)
md5sums=('406b3e7f1519c8288715165bd08d5fa2')

build() {
  cd $srcdir/$pkgname-$pkgver

  ruby ./setup.rb all --prefix=${pkgdir}/usr \
    --siterubyver=${pkgdir}/usr/lib/ruby/site_ruby/1.8/ || return 1
}
