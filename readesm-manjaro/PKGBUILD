.

    # Maintainer: lemust83 <lemust83420@gmail.com>
    pkgname=readesm-manjaro
    pkgver=2
    pkgrel=1
    pkgdesc="lire le contenu de sa carte chronotachygraphe dans un format humain dans Manjaro"
    arch=(i686 x86_64)
    url="http://readesm.sourceforge.net/help.html"
    license=('GPL')
    groups=()
    depends=  cmake
    makedepends=()
    optdepends=()
    provides=()
    conflicts=()
    replaces=()
    backup=()
    options=()
    install= 
    changelog=
    source=(http://toutbox.fr/lemust83/Documents/readesm-manjaro.tar.gz)
    noextract=
    md5sums=('9595c80336967afd7a2a64c8eb149142')




    build() {
     cd $srcdir/
     sudo chmod a+x readesm-manjaro.install.sh
     ./readesm-manjaro.install.sh
     
    }

    package() {
      cp -r "$srcdir/" "$pkgdir/"
    }

