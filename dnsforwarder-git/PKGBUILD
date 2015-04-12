# Maintainer:  Majia321 <@GMAIL dot com>
# Contributor: 

pkgname=dnsforwarder-git
_gitname=dnsforwarder
pkgver=464ab6b
pkgrel=1
pkgdesc="A dnsforwarder designed for anti-spoofing"
url="https://github.com/holmium/dnsforwarder"
arch=('i686' 'x86_64')
license=('GPL')
provides=('dnsforwarder')
conflicts=('dnsforwarder')
depends=('curl' 'openssl')
makedepends=('git')
install=dnsforwarder.install
backup=('etc/dnsforwarder.conf')
# Switch to branch '5',because the master branch latest committed on 8 Sep 2014.
source=("$_gitname"::"git+https://github.com/holmium/dnsforwarder.git#branch=5" 
#source=("$_gitname"::"git+https://github.com/holmium/dnsforwarder.git#branch=master" 
		  'dnsforwarder.service')
md5sums=('SKIP'
         '0f0ba464b105346749b0dd43f2402805')

pkgver() {
  cd "$_gitname"
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$_gitname"

  # Fix permission denied uglily
  chmod +x configure
  
  autoreconf
  ./configure --prefix=/usr \
  --enable-downloader=libcurl \
  --enable-base64decoder=openssl 
  
  # Convert codeset
  iconv -f gb18030 -t utf8 default.config > dnsforwarder.conf
  
  make 
}

package() {
  cd "$_gitname"

  make  DESTDIR="$pkgdir" install
  
  install -Dm644 "dnsforwarder.conf" "$pkgdir"/etc/dnsforwarder.conf
  install -Dm644 "$srcdir/dnsforwarder.service" "$pkgdir"/usr/lib/systemd/system/dnsforwarder.service
}
