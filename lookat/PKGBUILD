# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=lookat
pkgver=1.4.1
pkgrel=1
pkgdesc="A colorful text pager for viewing etexts, man pages, etc. (English version of bekijk)"
arch=('i686' 'x86_64')
url="http://www.wagemakers.be/english/programs/lookat"
license=('GPL')
depends=('ncurses')
backup=(etc/lookat.conf)
source=(http://www.wagemakers.be/uploads/37/16/${pkgname}_bekijk-$pkgver.tar.gz)
md5sums=('fe220e8c820f62518273ce6e3eec3ba9')

build() {
  cd $startdir/src/${pkgname}_bekijk-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

# move the config files from /usr/etc/ to /etc/
  mv $startdir/pkg/usr/etc $startdir/pkg/

# remove the Dutch version 
  rm $startdir/pkg/usr/share/man/man1/bekijk.1
  rm $startdir/pkg/usr/bin/bekijk
}
