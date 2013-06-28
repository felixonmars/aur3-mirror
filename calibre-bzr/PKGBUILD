# Maintainer: Your Name <youremail@domain.com>
pkgname=calibre-bzr
pkgver=0.9.36
pkgrel=1
pkgdesc="E-book library management application"
arch=('i386', 'x86_64')
url="http://calibre-ebook.com/"
license=('GPL3')
depends=( 'libmtp' 'qt4-private-headers' 'chmlib' 'coffee-script-git' 'desktop-file-utils' 'imagemagick' 'libusb' 'libwmf' 'podofo>=0.8.4' 'poppler>=0.12.0' 'python2-pyqt4' 'python2-beautifulsoup3' 'python2-cherrypy' 'python2-cssutils' 'python2-dateutil' 'python-dnspython' 'python-imaging' 'python-lxml' 'python2-mechanize' 'python-pypdf-git' 'shared-mime-info' 'unrar')
makedepends=('python2-pycountry' 'python2-distribute')
optdepends=()
provides=('calibre')
conflicts=('calibre')
backup=()
options=()
source=('calibre-mount-helper')

md5sums=('675cd87d41342119827ef706055491e7')

_pkgsrc=calibre
build() {
        cd "$srcdir"
        curl -L http://status.calibre-ebook.com/dist/src | tar xvJ 
        
        cd "$srcdir/$_pkgsrc"
        python2 setup.py build
#        python2 setup.py manual
        python2 setup.py resources 
      }

      package() {
              cd "$srcdir/$_pkgsrc"
          sed -i -e "s|(prefix=.*)|(prefix='$pkgdir/usr')|g" setup/install.py
         mkdir -p ${pkgdir}/usr/lib/python2.7/site-packages
         python2 setup.py install --root=${pkgdir}/ --prefix=/usr \
         --staging-bindir=${pkgdir}/usr/bin \
         --staging-libdir=${pkgdir}/usr/lib \
         --staging-sharedir=${pkgdir}/usr/share

         find ${pkgdir} -type d -empty -delete
         
         # Decompress the man pages so makepkg will do it for us.
#           for decom in ${pkgdir}/usr/share/man/man1/*.bz2; do
#            bzip2 -d ${decom}
#            done
         
        # See http://lwn.net/SubscriberLink/465311/7c299471a5399167/
        rm -rf ${pkgdir}/usr/bin/calibre-mount-helper
        install -m 755 ${srcdir}/calibre-mount-helper "${pkgdir}/usr/bin"

  }
