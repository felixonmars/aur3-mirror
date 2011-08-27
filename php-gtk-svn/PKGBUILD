# Maintainer: FzerorubigD <fzerorubigd {AT} Gmail {Dot} Com
# Contributor: Evangelos Foutras <foutrelis@gmail.com>
# Contributor:Xemertix <arch88(at)katamail(dot)com>

# Install instructions:
# Build without MAKEFLAGS="-j{n}"(/etc/makepkg.conf) if you have multicore processor. See http://marc.info/?l=php-gtk-dev&m=125993195018983
# Run makepkg --holdver 295934 (last known working revision according to http://old.nabble.com/php-gtk-configure-bug-td28460862.html)

pkgname=php-gtk-svn
pkgver=305956
pkgrel=1
pkgdesc="PHP bindings for the Gtk+ 2 library"
arch=('i686' 'x86_64')
url="http://gtk.php.net/"
license=('LGPL')
depends=('php' 'gtk2>=2.12.0' 'libglade>=2.6.2' 'php-pecl-cairo-svn')
makedepends=('pkgconfig' 'gtk2+extra' 'gtkhtml' 'libsexy' 'xulrunner'
             'gtksourceview' 'gtkspell')
optdepends=('gtk2+extra: extra extension'
            'gtkhtml: html extension'
            'libsexy: libsexy extension'
            'xulrunner: mozembed extension'
            'gtksourceview: sourceview extension'
            'gtkspell: spell extension')
provides=('php-gtk')
conflicts=('php-gtk')
backup=(etc/php/php-gtk.ini)
install=php-gtk.install
source=(php.ini-template	
	disable-open_basedir.patch)
md5sums=('219a7f7f336a4ed3fe27bb352b8199c3'
         '1654fc571317e32791ebf2db7791dbe5')

_svnmod="php-gtk"
_svntrunk="http://svn.php.net/repository/gtk/php-gtk/trunk"

build() {
  
cd ${srcdir}

  msg "Connecting to SVN server...."

  if [ -d ${_svnmod}/.svn ]; then
  (cd ${_svnmod} && svn up -r $pkgver)
  else
  svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod}
  fi

  msg "SVN checkout done or the server timed out"
  msg "Starting make..."

  svn export ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build



  ./buildconf
  #Temporary way to fix build problem.
  sed -i -e 's/gen_gtk-1\.c//g' configure
  ./configure --prefix=/usr \
              --with-extra=shared \
              --with-html=shared \
              --with-libsexy=shared \
              --with-mozembed=shared \
              --with-sourceview=shared \
              --with-spell=shared
  # We need to allow php to open files outside of open_basedir (defined
  # in /etc/php/php.ini) during the build
  patch -Np1 -i "$srcdir/disable-open_basedir.patch" || return 1

  make 
  make INSTALL_ROOT="$pkgdir" install
  install -D -m644 "$srcdir/php.ini-template" "$pkgdir/etc/php/php-gtk.ini"
  EXTENSION_DIR=$(php-config --extension-dir)
  sed -i "/^extension_dir/cextension_dir = \"$EXTENSION_DIR\"" \
         "$pkgdir/etc/php/php-gtk.ini"
}
