# by Taylan

pkgname=mit-scheme-git
pkgver=20111110
pkgrel=1
pkgdesc="MIT/GNU Scheme, from GIT"
arch=('x86_64' 'i686')
license=('GPL')
url='http://www.gnu.org/software/mit-scheme/'
provides=('mit-scheme')
depends=('libx11' 'texinfo' 'texlive-core')
builddepends=('mit-scheme') # no shit
optdepends=('mhash: support for mhash' 'gdbm: support for gdbm'
  'postgresql-libs: support for postresql' 'openssl: support for openssl'
  'mcrypt: support for mcrypt' 'db: support for berkeley db')
conflicts=('mit-scheme') # still no shit
provides=('mit-scheme')

_gitroot='http://git.savannah.gnu.org/cgit/mit-scheme.git'
_gitname=mit-scheme

build() {

    cd "$srcdir"
    msg "Connecting to GIT server ..."

    if [[ -d $_gitname ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make ..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    # MAKE

    cd src
    ./Setup.sh
    ./configure --with-x --enable-native-code --prefix=/usr
    make

    cd ../doc
    autoconf
    ./configure --prefix=/usr
    make -j 1 || true

}
package() {

    cd "$srcdir/$_gitname-build"

    cd src
    make DESTDIR="$pkgdir/" install

    # TODO: add indexer

    cd ../doc
    make DESTDIR="$pkgdir/" install || true
    rm "$pkgdir"/usr/share/info/dir

}

infodir=usr/share/info

filelist=(mit-scheme-ffi.info mit-scheme-imail.info mit-scheme-ref.info mit-scheme-sos.info mit-scheme-user.info)



post_install() {

  [[ -x usr/bin/install-info ]] || return 0

  for file in "${filelist[@]}"; do

    install-info "$infodir/$file.gz" "$infodir/dir" 2> /dev/null

  done

}



post_upgrade() {

  post_install "$1"

}



pre_remove() {

  [[ -x usr/bin/install-info ]] || return 1

  for file in "${filelist[@]}"; do

    install-info --delete "$infodir/$file.gz" "$infodir/dir" 2>/dev/null

  done

}
