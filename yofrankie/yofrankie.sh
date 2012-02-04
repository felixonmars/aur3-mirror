#!/bin/sh

if [[ ! -e ~/.yofrankie || `stat -c "%Y" /usr/share/yofrankie/levels` -ge `stat -c "%Y" ~/.yofrankie/levels` ]]; then
	for dir in "audio"  "chars" "effects" "hud" "levels" "menus" "props" "textures"; do
		if [[ ! -d ~/.yofrankie/${dir} ]]; then
			mkdir -p ~/.yofrankie/${dir}
		else
			# Remove any old broken links
			for i in ~/.yofrankie/${dir}/*; do
				if [[ -L ${i} && `file ${i}` == *"broken symbolic link"* ]]; then
					rm ${i}
				fi
			done
		fi

		for i in /usr/share/yofrankie/${dir}/*; do
			# Add links
			file=`basename ${i}`
			if [[ ! -e ~/.yofrankie/${dir}/${file} && ${file} != "start_menu.*" ]]; then
				ln -sf ${i} ~/.yofrankie/${dir}/${file}
			fi
		done

		if [[ ! -e ~/.yofrankie/levels/start_menu.blend ]]; then
			ln -sf /usr/share/yofrankie/yofrankie.blend ~/.yofrankie/levels/start_menu.blend
		fi
	done
fi

blenderplayer -f ~/.yofrankie/levels/start_menu.blend
