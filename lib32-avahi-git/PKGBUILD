#Maintainer: Phrearch <j.veenvan@gmail.com>
pkgname=lib32-avahi-git
pkgver=20110608
pkgrel=1
pkgdesc="A multicast/unicast DNS-SD framework"
arch=('x86_64')
url="http://avahi/org"
license=('LGPL')
groups=()
depends=('expat' 'lib32-libdaemon' 'lib32-glib2' 'lib32-dbus-core' 'lib32-libcap' 'lib32-gdbm' 'lib32-gtk3' 'pygtk' 'pygobject')
makedepends=('git')
md5sums=() #generate with 'makepkg -g'
_gitroot="git://git.0pointer.de/avahi.git"
_gitname="avahi"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  pushd $srcdir/$_gitname
  git checkout v0.6.30
  popd
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
 
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  sh autogen.sh --disable-qt3 --disable-manpages --disable-xmltoman
  #no qt3, manpages require xmltoman. disable for now, since its not in aur/repo
  ./configure --disable-qt3 --disable-manpages --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
                        --libexecdir=/usr/lib32 --libdir=/usr/lib32 \
                        --enable-introspection=no CC='gcc -m32' CXX='g++ -m32'
  
make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  rm -rf ${pkgdir}/usr/{sbin,bin,lib/python2.7,include,share}
  rm -rf ${pkgdir}/etc/
} 

