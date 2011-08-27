# Maintainer: Peter Lewis <prlewis@letterboxes.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Link Dupont <link@subpop.net>
# Contributor: Peter Johansson <pete@unlogical.net>

pkgname=bin32-cedega
pkgver=011006
pkgrel=3
arch=('x86_64')
pkgdesc="A program that lets you play Windows games in Linux - GUI only"
url="http://www.cedega.com/"
license=('custom')
depends=('python2' 'alsa-lib' 'libjpeg' 'pygtk' 'dbus-python' 'lib32-openssl' 'lib32-dbus-core')
options=('!strip')
replaces=('cedega-bin32')
source=('license.txt' 'cedega-arch.patch')
install=('cedega.install')
md5sums=('225e6f440847e0b6c1630bed1f1771e2'
         '8b8c32c3bd7b601802feffbff727af8d')
 
build() {
  cd $srcdir

  echo
  echo "ATTENTION: Parts of Cedega are NOT free software!"
  echo "These parts cannot be redistributed, by ArchLinux or anyone else."
  echo "If you decide to install this package, then you must first read and agree to the various licences which apply."
  echo
  echo "Press enter to display the licence agreement. When you have finished reading, hit q to return here."
  read
  cat license.txt | more
  echo 
  echo
  echo
  echo "Only if you have the right to use Cedega on this machine, and agree with the licences, should you install this software."
  echo
  echo "Do you assert that this is true? [y/n]"
  read answer

  while test -z "$answer"; do
   echo "You must answer y or n."
   echo "Do you assert that this is true? [y/n]"
   read answer
  done

  if [ $answer != "y" ] && [ $answer != "Y" ]; then
 	echo "You did not answer yes, therefore installation will abort!"
 	return 1
  fi

  echo "You are asserting that you have the right to use Cedega on this machine, and agree to its licences. Installation continuing..."

  wget http://www.cedega.com/downloads/packages/cedega-$pkgver.tgz
  bsdtar -x -f cedega-$pkgver.tgz
 
  cd $srcdir
  patch -p0 < cedega-arch.patch
}

package() {
  cd $srcdir
  cp -R usr $pkgdir
  install -m 644 -D $srcdir/license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

