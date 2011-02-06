# old Contributor: Francesco 'Kiko' Corsentino <kikocorsentino@gmail.com>
# Contributor: Michael Krauss <mickraus@googlemail.com>
pkgname=qdu
pkgver=2.2
pkgrel=4
pkgdesc="A graphical disk usage tool based on Qt"
depends=('qt3')
source=("http://artis.imag.fr/Membres/Gilles.Debunne/Code/QDU/$pkgname-$pkgver.tar.gz" 'qdu.desktop')
md5sums=('a13cac21d9d89980265f56e386a7467d' 'fe4f371c9dae76a082e99b1300996c74')

url="http://freshmeat.net/redir/qdu/38383/url_homepage/QDU"
license=("GPL")
arch=('i686' 'x86_64')

build() {
  # We need uic from qt3
  PATH=/opt/qt/bin:$PATH

  cd $startdir/src/$pkgname-$pkgver

  #change install target path
  sed -i -e "s:/usr/bin:$startdir/pkg/usr/bin:g" qdu.pro

  #fix bug in qduInterface.ui
  sed -i -e 's:hint>directoryview:hint>directoryView:g' qduInterface.ui

  # adjust qt builder version
  sed -i -e '/^<\!DOCTYPE/ s/3\.1/3\.3/' qduInterface.ui
  
  QTDIR=/opt/qt qmake
  make || return 1
  make install

  # install desktop file
  mkdir -p $startdir/pkg/usr/share/applications
  cp $startdir/qdu.desktop $startdir/pkg/usr/share/applications
}
