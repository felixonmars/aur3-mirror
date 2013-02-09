# Maintainer: aksr <aksr at t-com dot me>
pkgname=redshift-bzr
pkgver=100
pkgrel=1
pkgdesc="Adjusts the color temperature of your screen according to your surroundings."
arch=('i686' 'x86_64')
#url="http://jonls.dk/redshift/"
url="https://launchpad.net/redshift"
license=('GPL3')
groups=()
depends=('gconf' 'geoclue' 'libxxf86vm')
optdepends=('pygtk: for gtk-redshift'
            'pyxdg: for gtk-redshift'
            'librsvg: for gtk-redshift')
makedepends=('bzr' 'python2')
#provides=('')
conflicts=('redshift' 'redshift-minimal' 'redshift-minimal-bzr')
#replaces=()
#backup=()
#options=()
#install=
#source=()
#noextract=()
#md5sums=('SKIP') #generate with 'makepkg -g'



_bzrtrunk=lp:redshift
_bzrmod=redshift

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
   #cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
    cd "$_bzrmod" && bzr pull -r "$pkgver"
    msg "The local files are updated."
  else
    #bzr --no-plugins branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
    bzr branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"

  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  #
  # BUILD HERE
  #

  sed -i 's/python/python2/' src/gtk-redshift/gtk-redshift

  autoreconf -vi
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  #PYTHON=/usr/bin/python2 ./configure --disable-gui --disable-gnome-clock --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_bzrmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
