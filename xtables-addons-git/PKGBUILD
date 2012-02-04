# Contributor: Vladimir Kutyavin <vlkut@bk.ru>
pkgname=xtables-addons-git
pkgver=20110818
pkgrel=1
pkgdesc="Successor to patch-o-matic(-ng). Additional extensions for iptables, ip6tables, etc. CHAOS, TARPIT, TEE, DELUDE and other targets; condition, geoip, ipp2p and other matches. Includes ipset package."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://xtables-addons.sourceforge.net/"
depends=('iptables>=1.4.3' 'glibc')
makedepends=('linux-api-headers')
conflicts=(ipset, xtables-addons)
replaces=(ipset, xtables-addons)
provides=(ipset, xtables-addons)

_gitroot="git://xtables-addons.git.sf.net/gitroot/xtables-addons/xtables-addons/"
_gitname="xtables-addons"

build() {

  msg 'Connecting to GIT server...'

  if [[ -d $_gitname ]]; then
    ( cd $_gitname && git pull origin )
    msg 'The local files are updated.'
  else
    git clone $_gitroot
  fi

  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  rm -rf $_gitname-build
  git clone $_gitname{,-build}
  cd $_gitname-build

 ./autogen.sh
 ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/iptables \
    --sysconfdir=/etc \
    --with-xtlibdir=/usr/lib/iptables \
    --mandir=/usr/share/man
    make || return 1
    make DESTDIR=$pkgdir install || return 1 
    chmod a-x $pkgdir/usr/lib/iptables/*.so
    #remove ipset there is a ipset package
#    rm \
#    $pkgdir/usr/lib/iptables/libipset_* \
#    $pkgdir/usr/sbin/ipset
#    $pkgdir/usr/share/man/man8/ipset.8
#    rmdir $pkgdir/usr/sbin
}
