# Maintainer: exis10z
pkgname='ruby1.8.6-legacy'
pkgver=1.8.6_p399
_pkgsourcever=1.8.6-p399
pkgrel=1
pkgdesc="A slighly older but extremely stable version of Ruby for use with earlier versions of Ruby on Rails and other gems."
arch=('i686' 'x86_64')
license=('custom')
url="http://www.ruby-lang.org/en/"
makedepends=('tk>=8.5')
provides=('ruby=1.8.6')
source=(ftp://ftp.ruby-lang.org/pub/ruby/stable/ruby-${_pkgsourcever}.tar.bz2 openssl-1.0.patch)
options=('!emptydirs')
depends=('gdbm>=1.8.3' 'db>=4.8.26' 'openssl>=1.0.0' 'zlib>=1.2.5' 'readline>=6.1', 'tk')
optdepends=('rubygems: The package management framework for Ruby (recommended)'
            'ruby-sqlite3: Default light-weight database for Rails and other Ruby frameworks')

build() {
  cd "${srcdir}/ruby-${_pkgsourcever}"
  patch -p1 < ${srcdir}/openssl-1.0.patch || return 1
  ./configure --prefix=/usr --enable-shared --enable-pthread || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" || return 1
}

md5sums=('f77c307cb72fb8808b0e85af5d05cefc'
         '4ba2533e9b85fa6db21b33fcd5fb5cde')
