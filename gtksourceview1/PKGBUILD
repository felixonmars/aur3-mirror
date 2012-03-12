
pkgname=gtksourceview1
pkgver=1.8.5
pkgrel=1
pkgdesc="GtkSourceView 1.x for mulitiline text editing"
url="http://projects.gnome.org/gtksourceview/index.html"
arch=('i686' 'x86_64')   
depends=('gtk2'
'libgnomeprint'
'libxml2')
# using .deb as gtksourceview-1.8.5 needs ancient "GTK+-2.8.x, libxml2 2.5.x and libgnomeprint 2.8.x." for compilation
source=("http://mirrors.rit.edu/ubuntu//pool/universe/g/gtksourceview/libgtksourceview-common_1.8.5-2build1_all.deb"
"http://mirrors.rit.edu/ubuntu//pool/universe/g/gtksourceview/libgtksourceview1.0-0_1.8.5-2build1_amd64.deb"
#"http://ftp.gnome.org/pub/gnome/sources/gtksourceview/1.8/gtksourceview-$pkgver.tar.bz2"
)
sha256sums=('b832715b54576031d68b3fec4632f517302a3dbd75aeafea888a0e50bfeed6dd'
'3151b42ff0199703dd674bdaf2ccb16f4e9a718cb9d06f6bb8fe1e981c9e8034'
#'19c6575457fb99764f3e71197503e4c275bd03e35245afe1cf3b584e70bf0f8d'
)
license=('LGPL2.1')

build() {
     
    install -d "$pkgdir"/usr/{lib,share/doc/{libgtksourceview1.0-0,libgtksourceview-common},share/gtksourceview-1.0/language-specs}
    for i in libgtksourceview1.0-0 libgtksourceview-common
        do cd "$srcdir"
	mkdir $i
	cp ./$i*.deb ./$i/
        cd ./$i
	ar x ./$i*.deb
        tar xf data.tar.gz
        if [ -d ./usr/lib/ ]
	  then local libname=${i/1.0-0/-1.0.so.0}	
	  install -m755 ./usr/lib/$libname.0.0 "$pkgdir/usr/lib/"
          ln -s "$pkgdir/usr/lib/$libname.0.0" "$pkgdir/usr/lib/$libname"
	fi
	install -t "$pkgdir/usr/share/doc/$i" -m644 ./usr/share/doc/$i/*
	[ -d ./usr/share/gtksourceview-1.0 ] && install -t "$pkgdir"/usr/share/*/language-specs -m644 ./usr/share/*/language-specs/*
    done
   
}
