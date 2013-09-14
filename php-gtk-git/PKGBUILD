# Maintainer: X0rg

pkgname=php-gtk-git
_gitname=php-gtk
pkgver=2307.e972b25
pkgrel=8
pkgdesc="PHP bindings for the Gtk+ 2 library"
arch=('any')
url="http://gtk.php.net/"
license=('LGPL2.1')
depends=('php>=5.1.2' 'php<=5.5.0' 'gtk2>=2.6.0' 'gtk2+extra>=2.1.1' 'libsexy>=0.1.10' 'php-pecl-cairo-svn' 're2c>=0.13.4' 'libglade>=2.4.0' 'glib2>=2.6.0' 'atk>=1.9.0' 'cairo>=1.4.0')
makedepends=('git')
provides=('php-gtk')
conflicts=('php-gtk')
backup=(etc/php/php-gtk.ini)
install=php-gtk.install
options=('!makeflags' '!libtool')
source=('php-gtk::git://git.php.net/php/gtk-src.git'
	'php-gtk.ini')
md5sums=('SKIP'
         'ee998d65f0e002f8978e6ba2197aa8b0')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $_gitname
  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Désactive 'open_basedir'..."
  else
    msg2 "Disable 'open_basedir'..."
  fi
  (set -x ; sed -i "s/PHP=\$PHP_PREFIX\/bin\/php/PHP=\"\$PHP_PREFIX\/bin\/php -d 'open_basedir='\"/g" ./config.m4)
}

build() {
  cd $_gitname
  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'buildconf'..."
  else
    msg2 "Run 'buildconf'..."
  fi
  ./buildconf --with-phpize=/usr/bin/phpize

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'configure'..."
  else
    msg2 "Run 'configure'..."
  fi
  ./configure --prefix=/usr --with-php-config=/usr/bin/php-config \
	--enable-php-gtk --with-extra --with-libsexy
  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'make'..."
  else
    msg2 "Run 'make'..."
  fi
  make
}

# check() {
#   cd $_gitname
#   make test
# }

package() {
  cd $_gitname
  make INSTALL_ROOT=$pkgdir install

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Installe le fichier '/etc/php/php-gtk.ini'..."
  else
    msg2 "Install '/etc/php/php-gtk.ini' file..."
  fi
  install -D -m644 "$srcdir/php-gtk.ini" "$pkgdir/etc/php/php-gtk.ini"
}
