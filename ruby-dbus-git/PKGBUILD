# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=ruby-dbus-git
pkgver=20100719
pkgrel=1
pkgdesc="A Ruby binding for DBus"
arch=('i686' 'x86_64')
url="https://trac.luon.net/ruby-dbus/"
license=('GPL')
groups=()
depends=('ruby>=1.8.6')
makedepends=('gcc' 'cmake' 'automoc4' 'git')
provides=(ruby-dbus)
conflicts=(ruby-dbus)
replaces=()
backup=()
options=()
source=()
noextract=()
md5sums=()

_gitroot="git://github.com/mvidner/ruby-dbus.git"
_gitname="mainline"


build(){

  cd $srcdir

  if [[ -d $_gitname ]]; then
	(cd $_gitname && git pull origin)
  else
	git clone $_gitroot $_gitname
  fi
  
  cd $_gitname
  ruby setup.rb config
  ruby setup.rb setup
  ruby setup.rb install --prefix=${pkgdir}
}
 
