pkgname=jabberd14-ubuntu
_pkgname=jabberd14
pkgver=1.6.1.1
pkgrel=1
pkgdesc="XMPP Server with ubuntu patches"
arch=('i686' 'x86_64')
url="http://jabberd.org/"
license=('GPL')
#depends=('expat' 'udns' 'libidn' 'libgsasl')
#makedepends=('expat' 'udns' 'libidn' 'libgsasl' 'openssl' 'mysql')
source=("http://download.jabberd.org/jabberd14/jabberd14-1.6.1.1.tar.gz" "http://archive.ubuntu.com/ubuntu/pool/universe/j/jabberd14/jabberd14_1.6.1.1-5.diff.gz" "jabberd")
md5sums=('597c7ee14518ba22b1cee883b4737d87' 'cffda97f4a6c19aa318bf740a319d981' 'e3e672e81e6a70d02d7458e0edd4021c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p1 < ../jabberd14_1.6.1.1-5.diff || return 1

  for i in `ls debian/patches/*.dpatch* | sort`
  do
    patch -p1 -s -i $i
    if [ $? = 0 ]; then
      echo "$i applied"
    else
      echo "Error processing $i"
      return 1
    fi
  done

  ./configure --prefix=/usr --enable-ssl --enable-legacy --sysconfdir=/etc/jabberd --localstatedir=/var || return 1

  make -j1 || return 1
  make DESTDIR="$pkgdir/" install || return 1
  mkdir -p $startdir/pkg/etc/rc.d/ && \
  install -m 0755 $startdir/src/jabberd $startdir/pkg/etc/rc.d/jabberd
}

# vim:set ts=2 sw=2 et:
