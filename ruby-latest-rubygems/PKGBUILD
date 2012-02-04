# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

_pkgname=ruby
pkgname=ruby-latest-rubygems
pkgver=1.9.3_p0
_rubygems_pkgver=1.8.11
pkgrel=1
pkgdesc="An object-oriented language for quick and easy programming, with updated rubygems"
arch=('i686' 'x86_64')
url="http://www.ruby-lang.org/en/"
license=('custom')
depends=('openssl' 'libffi' 'libyaml')
provides=('ruby= 1.9.2_p180' 'rubygems' 'rake')
conflicts=('ruby' 'rake')
optdepends=('tk: for Ruby/TK')
makedepends=('openssl' 'tk' 'libffi' 'doxygen' 'graphviz')
options=('!emptydirs' '!makeflags')
source=("ftp://ftp.ruby-lang.org/pub/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver//_/-}.tar.bz2"
        "http://production.cf.rubygems.org/rubygems/rubygems-${_rubygems_pkgver}.tgz"
        "rubygems-use-std-dir.patch")
sha1sums=('f63c116411b981ef54c2caeefb9ccc4d71a5d2cf'
          '88677a3443d6becdc0cde540d73304bdfb88fe11'
          'a014ecf0768ee855b5efc4443722b327a6299f47')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
  ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --enable-shared \
      --enable-pthread \
      --disable-rpath
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
  make DESTDIR="${pkgdir}" install-nodoc
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # This would be a nicer option, but I can't get the env variables right...
  #cd "${pkgdir}"
  #./usr/bin/gem install rubygems-update -i "${pkgdir}/usr/lib/ruby/gems/1.9.1" -n "${pkgdir}/usr/bin"
  #GEM_PATH="${pkgdir}/usr/lib/ruby/gems/1.9.1" ./usr/bin/update_rubygems --prefix="${pkgdir}/usr/lib/ruby/1.9.1"
  #./usr/bin/gem uninstall rubygems-update -i "${pkgdir}/usr/lib/ruby/gems/1.9.1" -n "${pkgdir}/usr/bin" -x

  cd "${srcdir}/rubygems-${_rubygems_pkgver}"
  
  # This works if setup_command.rb is patched to use standard ruby install paths
  patch -p0 < "../rubygems-use-std-dir.patch"

  RUBYLIB="${pkgdir}/usr/lib/ruby/1.9.1:${pkgdir}/usr/lib/ruby/1.9.1/${CARCH}-linux" LD_LIBRARY_PATH="${pkgdir}/usr/lib":$LD_LIBRARY_PATH "${pkgdir}/usr/bin/ruby" setup.rb --destdir="${pkgdir}" --prefix="/usr"

  # The gem binary will have the wrong shebang now, since it uses the ruby it
  # was called with. Reset it.
  sed -i 's/#!.*\/usr\/bin\/ruby/#!\/usr\/bin\/ruby/' "${pkgdir}/usr/bin/gem"
}
