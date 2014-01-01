# Maintainer: Erik Zenker <erikzenker@hotmail.com>
pkgname=palava
pkgver=20130206
pkgrel=0
pkgdesc="Palava-machine and portal"
arch=('i686' 'x86_64' 'armv6h')
url="https://palava.tv/"
license=('MIT')
depends=('redis' 'ruby' 'ruby-bundler')
makedepends=('git')
provides=('palava')
_github=erikzenker
_gitname_machine=palava-machine
_gitname_portal=palava-portal
_gitroot_machine=https://github.com/$_github/$_gitname_machine
_gitroot_portal=https://github.com/$_github/$_gitname_portal


build() {
   
   # PALVA_MACHINE ######################################
   cd $srcdir
   msg "Getting sources of palava-machine..."

   if [ -d $srcdir/$_gitname_machine ] ; then
      (cd $_gitname_machine && git pull --depth=1)
      	msg "The local files are updated."
   else
	git clone --depth=1 $_gitroot_machine
   fi
   msg "GIT checkout done or server timeout"
   msg "Starting build..."
   
   cd $srcdir/$_gitname_machine
   echo ruby \'2.0.0\' >> Gemfile
   bundle install || return 1
   
   # PALAVA_PORTAL #####################################
   cd $srcdir
   msg "Getting sources of palava-portal..."

   if [ -d $srcdir/$_gitname_portal ] ; then
      (cd $_gitname_portal && git pull --depth=1)
      	msg "The local files are updated."
   else
	git clone --depth=1 $_gitroot_portal
        cd $_gitname_portal
	git submodule init
	git submodule update
   fi
   msg "GIT checkout done or server timeout"
   msg "Starting build..."
   
   cd $srcdir/$_gitname_portal
   echo ruby \'2.0.0\' >> Gemfile
   bundle install || return 1
   msg "build static palava-portal, this can take some time..."
   bundle exec middleman build

}

package() {
  #install machine
  cd "$srcdir/$_gitname_machine"
  install -m755 -d $pkgdir/usr/share/webapps/$_gitname_machine
  install -m755 -d $pkgdir/usr/bin
  cp -r * $pkgdir/usr/share/webapps/$_gitname_machine
  cp -s $pkgdir/usr/share/webapps/$_gitname_machine/bin/palava-machine $pkgdir/usr/bin

  #install portal
  cd "$srcdir/$_gitname_portal"
  install -m755 -d $pkgdir/usr/share/webapps/$_gitname_portal
  cp -r * $pkgdir/usr/share/webapps/$_gitname_portal
  chmod a+w $pkgdir/usr/share/webapps/$_gitname_portal

}