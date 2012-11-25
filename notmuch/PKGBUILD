# Maintainer: fauno <fauno at kiwwwi.com.ar>
# Maintainer: Olivier Ramonat <olivier at ramonat dot fr>
# Maintainer: Richard Murri <admin@richardmurri.com>

pkgname=notmuch
pkgver=0.14
pkgrel=2
pkgdesc="Notmuch is not much of an email program"
arch=(i686 x86_64 mips64el)
url="http://notmuchmail.org/"
license=('GPL3')
depends=('xapian-core' 'gmime' 'talloc')
makedepends=('python2' 'python' 'emacs' 'gnupg' 'ruby' 'pkgconfig')
optdepends=('emacs: for using the emacs interface'
            'vim: for using the vim interface'
            'python2: for using the python bindings'
            'ruby: for using the ruby bindings'
            'gnupg: for email encryption')
options=(!distcc !makeflags)

source=("http://notmuchmail.org/releases/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc
  make 

  cd bindings/ruby
  ruby extconf.rb
  make

  cp -r $srcdir/${pkgname}-${pkgver}/bindings/python{,2}

  cd $srcdir/${pkgname}-${pkgver}/bindings/python
  env LD_LIBRARY_PATH="." python setup.py build

  cd $srcdir/${pkgname}-${pkgver}/bindings/python2
  find "." -name '*.py' -print0 |xargs -0 \
      sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
      -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'
  env LD_LIBRARY_PATH="." python2 setup.py build
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make test
}

package(){
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" LIBDIR_IN_LDCONFIG=0 install

  install -D notmuch $pkgdir/usr/sbin/notmuch

  mkdir -p $pkgdir/usr/share/vim/vimfiles/{plugin,syntax}

  cd vim && make PREFIX="$pkgdir/usr/share/vim/vimfiles" install

  # Install python bindings

  cd $srcdir/${pkgname}-${pkgver}/bindings/python2
  env LD_LIBRARY_PATH="." python2 setup.py install --prefix=/usr --root=$pkgdir

  cd $srcdir/${pkgname}-${pkgver}/bindings/python
  env LD_LIBRARY_PATH="." python setup.py install --prefix=/usr --root=$pkgdir

# Install ruby bindings
  cd $srcdir/${pkgname}-${pkgver}/bindings/ruby
  sed -i -e 's,/site_ruby,,g' Makefile
  make prefix=${pkgdir}/usr install

# Remove conflicting zsh completion
  rm -r ${pkgdir}/usr/share/zsh
}
md5sums=('5eb3f225d3eb37862932f6baa5780d15')
