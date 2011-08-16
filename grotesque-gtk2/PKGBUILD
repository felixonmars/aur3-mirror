# Contributor: Brandon Invergo < http://www.brandoninvergo.com >
pkgname=grotesque-gtk2
pkgver=0.9.2
pkgrel=1
pkgdesc="A utility that helps you manage your collection of interactive fiction, or text adventures."
arch=(i686 x86_64)
url="http://grotesque.sourceforge.net/"
license=('gpl')
depends=('pygobject')
groups=()
source=(http://downloads.sourceforge.net/grotesque/grotesque-${pkgver}-gtk2.tar.gz)

md5sums=('0a16aa167b8e12c18f628f4a7be9ff73')

build() {
      cd $srcdir/grotesque-${pkgver}-gtk2
        python2 setup.py bdist
          cd $startdir/pkg
            
            tar xvfz $srcdir/grotesque-${pkgver}-gtk2/dist/grotesque-${pkgver}-gtk2.linux-${arch}.tar.gz
              #mkdir $startdir/pkg/usr/lib/python2.7/site-packages/grotesque/data
                cp $srcdir/grotesque-${pkgver}-gtk3/src/grotesque/data/grotesque_icon.png $startdir/pkg/usr/lib/python2.7/site-packages/grotesque/data

            }
