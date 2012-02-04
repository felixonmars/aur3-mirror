pkgname=ruby-bleak-house
pkgver=1.8.7_p72
_pkgver=1.8.7-p72
pkgrel=1
pkgdesc="An object-oriented language for quick and easy programming (with memory profiling patch)"
arch=(i686 x86_64)
license=('custom')
url="http://www.ruby-lang.org/en/"
depends=('gdbm' 'db>=4.7' 'openssl>=0.9.8h-3' 'zlib' 'readline' 'termcap-compat')
makedepends=('ruby')
source=(ftp://ftp.ruby-lang.org/pub/ruby/stable/ruby-${_pkgver}.tar.bz2 gc.patch)
options=('!emptydirs' 'force')
md5sums=('0b215c46b89b28d7ab8d56d96e72d5b9'
         '5d5b767b8fa677c7faa89e7b26b37dfd')

build() {
  cd ${startdir}/src/ruby-${_pkgver}
  patch -p0 < ${startdir}/src/gc.patch
  ./configure --prefix=/usr --enable-shared # --with-static-linked-ext
  ruby <<-RUBY
    require 'rbconfig'

    # Patch the makefile for arch/sitedir
    makefile = File.read('Makefile')
    %w{arch sitearch sitedir}.each do | key |
      makefile.gsub!(/#{key} = .*/, "#{key} = #{Config::CONFIG[key]}")
    end
    File.open('Makefile', 'w'){|f| f.puts(makefile) }

    # Patch the config.h for constants
    constants = {
      'RUBY_LIB' => 'rubylibdir',          #define RUBY_LIB "/usr/lib/ruby/1.8"
      'RUBY_SITE_LIB' => 'sitedir',        #define RUBY_SITE_LIB "/usr/lib/ruby/site_ruby"
      'RUBY_SITE_LIB2' => 'sitelibdir',    #define RUBY_SITE_LIB2 "/usr/lib/ruby/site_ruby/1.8"
      'RUBY_PLATFORM' => 'arch',           #define RUBY_PLATFORM "i686-linux"
      'RUBY_ARCHLIB' => 'topdir',          #define RUBY_ARCHLIB "/usr/lib/ruby/1.8/i686-linux"
      'RUBY_SITE_ARCHLIB' => 'sitearchdir' #define RUBY_SITE_ARCHLIB "/usr/lib/ruby/site_ruby/1.8/i686-linux"
    }
    config_h = File.read('config.h')
    constants.each do | const, key |
      config_h.gsub!(/#define #{const} .*/, "#define #{const} \"#{Config::CONFIG[key]}\"")
    end
    File.open('config.h', 'w'){|f| f.puts(config_h) }
RUBY
  make || return 1
  mkdir -p ${startdir}/pkg/usr/bin
  cp miniruby ${startdir}/pkg/usr/bin/ruby-bleak-house
}
