# 

pkgname=outwiker-bzr
_realname=outwiker
pkgver=565
_pkgver=1.4.0-1
pkgrel=1
arch=('any')
pkgdesc="Outliner and personal wiki with keeping the tree of notes in the form of directories on disk"
#url="http://jenyay.net/Soft/Outwiker"
license=('GPL3')
depends=('wxpython' 'pywebkitgtk')
optdepends=('mimetex: rendering of formulas'
            'python-gnomeprint: printing non-latin symbols')
provides=($_realname)
conflicts=($_realname)

url="http://launchpad.net/outwiker"
_bzrtrunk='lp:outwiker/trunk'
_bzrmod='outwiker'
#bzr branch lp:outwiker/trunk

build() {
  cd "${srcdir}"

  msg2 "Connecting to the server...."
  if [ ! -d "${srcdir}/${_bzrmod}" ]; then
    bzr co ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  else
    bzr up ${_bzrmod} -r ${pkgver}
  fi
  msg2 "BZR checkout done or server timeout"

}


package() {  

   install -dm755 "$srcdir"/patched
   cp -a "$srcdir"/$_bzrmod "$srcdir"/patched

   cd "$srcdir"/patched/$_realname

   msg2 "Applying patch for python2..."

   # python2 fix
   for file in $(find . -name '*.py' -print); do
      sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
      sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
   done
   
    # install -d -m755 "${pkgdir}/usr/share/${_realname}"

    install -D -m644 "$srcdir"/patched/$_realname/src/runoutwiker.py "$pkgdir"/usr/share/$_realname/runoutwiker.py
    install -m644 "$srcdir"/patched/$_realname/src/version.txt "$pkgdir"/usr/share/$_realname
    install -m644 "$srcdir"/patched/$_realname/{copyright,README} "$pkgdir"/usr/share/$_realname

    cp -r "$srcdir"/patched/$_realname/src/outwiker "$pkgdir"/usr/share/$_realname
    cp -r "$srcdir"/patched/$_realname/src/{help,images,locale,plugins,templates} "$pkgdir"/usr/share/$_realname
    #cp -r "../src/help" $outwiker_dir
    #cp -r "../src/images" $outwiker_dir
    #cp -r "../src/locale" $outwiker_dir
    #cp -r "../src/plugins" $outwiker_dir
    #cp -r "../src/templates" $outwiker_dir

    cd "$pkgdir"/usr/share/${_realname}
    # remove *.pyc, *.wxg, *.py~, *.wxg~ 
    find . -name *.pyc -type f -print | xargs rm -f
    find . -name *.py~ -type f -print | xargs rm -f
    find . -name *.wxg -type f -print | xargs rm -f
    find . -name *.wxg~ -type f -print | xargs rm -f
    find . -name *.~1~ -type f -print | xargs rm -f


    # install desktop file and icon

    install -Dm644 "${srcdir}"/patched/$_realname/distrib/$_realname-$_pkgver/usr/share/applications/outwiker.desktop $pkgdir/usr/share/applications/$_realname.desktop
    install -Dm755 "${srcdir}"/patched/$_realname/distrib/$_realname-$_pkgver/usr/bin/$_realname $pkgdir/usr/bin/$_realname
    # python2 fix
    sed -i -e 's/python /python2 /' ${pkgdir}/usr/bin/$_realname

    install -Dm644 "${srcdir}"/patched/$_realname/distrib/$_realname-$_pkgver/usr/share/pixmaps/$_realname.png $pkgdir/usr/share/pixmaps/$_realname.png

    rm -fR "${srcdir}"/patched
    find "$pkgdir"/usr/share/$_realname -type f -exec chmod a-x,u+w {} \;

}



