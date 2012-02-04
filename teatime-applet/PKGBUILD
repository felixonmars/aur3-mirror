# Contributor: bender02 at gmx dot com
pkgname=teatime-applet
pkgver=3.3
pkgrel=1
pkgdesc="Teatime applet for GNOME"
arch=('i686' 'x86_64')
url="http://det.cable.nu/teatime/index.rbx"
license=('GPL2')
install=$pkgname.install
depends=('ruby-gconf2' 'ruby-gettext' 'ruby-gnome2' \
         'ruby-panelapplet2' 'ruby-gstreamer')
source=(http://det.cable.nu/pakete/teatime-$pkgver.tar.bz2)

build() {
  cd $srcdir/teatime-$pkgver/teatime

  # since the 'install' insists on modifying the system files,
  # need to do some hackery
  # oh, I wish the programmers were a little smarter with this

  # we're gonna copy it ourselves so that pacman keeps track of it
  install -D -m 644 data-ext/GNOME_TeatimeApplet3_Factory.server \
      $pkgdir/usr/lib/bonobo/servers/GNOME_TeatimeApplet3_Factory.server || return 1

  # copy the schemas ourselves as well
  install -D -m 644 data-ext/teatime_applet_3.schemas \
      $pkgdir/usr/share/gconf/schemas/teatime_applet_3.schemas || return 1
  # ditch the post-install hook completely (what needs to be done is done
  # from the .install file
  rm post-install.rb || return 1

  # finally...
  ruby setup.rb config || return 1
  ruby setup.rb setup || return 1
  ruby setup.rb install --prefix=$pkgdir || return 1
}
