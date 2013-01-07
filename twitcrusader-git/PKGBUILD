# Maintainer: Patryk Rzucidlo (@PTKDev) <ptkdev@gmail.com>
# Contributor: Orazio Briante (@KernelMonkey) <orazio.1985@hotmail.com>
# Contributor: Alessio Biancalana (@dottorblaster) <dottorblaster@archlinux.us>

# SUPPORT:
# Follow on Twitter: @teamtwc / @PTKDev / @KernelMonkey / @dottorblaster
# IRC: chat.freenode.net at #teamtwc
# E-mail: teamtwc@twitcrusader.org


pkgname=twitcrusader-git
pkgver=20130105
pkgrel=1
pkgdesc="A Twitter client for Linux (Nightly Release)"
arch=('i686' 'x86_64')
url="http://www.twitcrusader.org"
license=('GPL')
depends=('gtk3' 'curl' 'liboauth' 'libxml2' 'libnotify' 'json-c' 'xdg-utils')
makedepends=('git' 'intltool' 'pkg-config' 'gcc' 'autoconf')
provides=('twitcrusader')
conflicts=('twitcrusader')

git_tree="git://github.com/PTKDev/ClientTwitter-TwitCrusader.git"
git_name="twitcrusader"
git_branch="nightly"
git_commit="de68062e37578173513cde52b308b8dac6f829ad"

build() {
  cd "${srcdir}"
  
  if [ -d $git_name ] ; then
	cd $git_name
	git checkout $git_branch
	git pull
	git submodule update 
	msg "The local files are updated."
  else
	git clone --recursive $git_tree $git_name && cd $git_name
  fi
    
	git checkout $git_commit

  sh autogen.sh --prefix=/usr
  make
}
 
package() {
  cd "${srcdir}/${git_name}"
  make DESTDIR="${pkgdir}" install
}
