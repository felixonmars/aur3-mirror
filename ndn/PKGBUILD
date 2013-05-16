# Maintainer:
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=ndn
pkgver=2.31.5309
pkgrel=2
pkgdesc="Necromancer's Dos Navigator is a clone of the famous 'Norton Commander' with added features"
arch=(i686 x86_64)
url="http://ndn.muxe.com/"
license=('custom')
depends=(lib32-glibc bash)
source=(http://ndn.muxe.com/download/file/ndn_2_31_5309_bin_lnx.tgz
	ndn.sh)
md5sums=(cebc54adfda9aeddd8a6bc1d60bc87a1
	 e10452b3d18b39d9355e1a0be63e538e)

prepare () {

    cd $srcdir/doc
    rename LICENCE.TXT LICENSE.TXT LICENCE.TXT

}

package () {
    cd $srcdir
    
    for items in $(ls -al | grep -P "^[d]" | sed -r '/^.*(\.|\.\.)$/d ; s/.*\s//')
    do
	if [[ $items = "ico" ]]; then
	    true;
	else
	    install -d $pkgdir/opt/$pkgname/$items;
	fi
    done

    install -m 644 -t $pkgdir/opt/$pkgname/lib \
	lib/locale.so
    install -m 644 -t $pkgdir/opt/$pkgname/colors \
	colors/*.pal \
	colors/*.ion \
	colors/*.diz

    cd doc 

    for files in $(ls -a1 | sed -r '/^(\.|\.\.)$/d')
    do
	install -m 644 -t $pkgdir/opt/$pkgname/doc $files
    done
    
    cd ../

    install -Dm 644 doc/LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/LICENSE

    cd plugins

    for files in $(ls -a1 | sed -r '/^(\.|\.\.)$/d')
    do
	install -m 644 -t $pkgdir/opt/$pkgname/plugins $files
    done

    cd ../ 

    install -m 644 -t $pkgdir/opt/$pkgname/ssavers \
	ssavers/*.ss \
	ssavers/*.ion

    install -m 644 -t $pkgdir/opt/$pkgname/xlt \
	xlt/*.xlt \
	xlt/*.diz \
	xlt/*.ion
    
    for monkeys in $(ls -al | grep -P "^[^d]" | sed '1d ; s/.*\s// ; /russian.*/d ; /^.*tgz$/d ; /make\.mess\.txt/d ; /^ndn$/d ; /\/home.*/d')
    do
	if [[ "$monkeys" = "ndn.dsk" ]]; then
	    install -Dm 646 $monkeys $pkgdir/opt/$pkgname/$monkeys
	elif [[ "$monkeys" = "ndn.his" ]]; then 
	    install -Dm 646 $monkeys $pkgdir/opt/$pkgname/$monkeys
	else 
	    install -Dm 644 $monkeys $pkgdir/opt/$pkgname/$monkeys
	fi

    done

    install -Dm 755 $pkgname $pkgdir/opt/$pkgname/$pkgname

    install -Dm 755 ${pkgname}.sh $pkgdir/usr/bin/$pkgname

}
